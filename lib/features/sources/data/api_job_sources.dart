import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html_parser;

import '../../../core/utils/job_text.dart';
import '../../jobs/domain/job.dart';
import '../../keywords/domain/keyword_matcher.dart';
import '../domain/job_source.dart';

class RemotiveJobSource implements JobSource {
  RemotiveJobSource({required this._dio, DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final Dio _dio;
  final DateTime Function() _now;
  List<Job> _cache = const [];
  DateTime? _lastFetch;
  static const minimumFetchInterval = Duration(hours: 6);

  @override
  String get id => 'remotive';
  @override
  String get name => 'Remotive';

  @override
  Future<List<Job>> search({
    required List<String> requiredKeywords,
    String? location,
  }) async {
    if (requiredKeywords.isEmpty) return const [];
    final lastFetch = _lastFetch;
    if (lastFetch == null ||
        _now().difference(lastFetch) >= minimumFetchInterval) {
      await _fetch();
    }
    return _filter(_cache, requiredKeywords, location);
  }

  Future<void> _fetch() async {
    final response = await _getWithRetry(
      _dio,
      'https://remotive.com/api/remote-jobs',
    );
    final body = response.data;
    if (body is! Map<String, dynamic> || body['jobs'] is! List) {
      throw const JobSourceException(
        SourceFailureKind.invalidResponse,
        'Remotive returned an unexpected response.',
      );
    }
    _cache = (body['jobs'] as List)
        .whereType<Map<String, dynamic>>()
        .map(_parseRemotive)
        .whereType<Job>()
        .toList(growable: false);
    _lastFetch = _now();
  }

  Job? _parseRemotive(Map<String, dynamic> data) {
    final sourceUrl = _validWebUrl(data['url']);
    final title = _text(data['title']);
    if (sourceUrl == null || title.isEmpty) return null;
    final requiredLocation = _text(data['candidate_required_location']);
    final description = _plainText(_text(data['description']));
    final salary = _parseSalary(_text(data['salary']));
    final publishedAt = DateTime.tryParse(_text(data['publication_date']));
    return Job(
      id: '$id:${data['id'] ?? sourceUrl}',
      sourceId: id,
      sourceName: name,
      sourceJobId: data['id']?.toString(),
      title: title,
      company: _text(data['company_name']),
      description: description,
      location: requiredLocation.isEmpty ? 'Remote' : requiredLocation,
      country: null,
      workArrangement: WorkArrangement.remote,
      employmentType: _normalizeEmployment(_text(data['job_type'])),
      salaryMin: salary.$1,
      salaryMax: salary.$2,
      salaryCurrency: salary.$3,
      requiredSkills: const [],
      publishedAt: publishedAt,
      discoveredAt: _now(),
      applicationUrl: sourceUrl,
      originalSourceUrl: sourceUrl,
      eligibleCountries: requiredLocation.isEmpty
          ? const []
          : requiredLocation.split(',').map((value) => value.trim()).toList(),
      sourceReferences: [
        JobSourceReference(
          sourceId: id,
          sourceName: name,
          sourceJobId: data['id']?.toString(),
          originalUrl: sourceUrl,
        ),
      ],
    );
  }

  @override
  Future<bool> isAvailable() async {
    try {
      final response = await _dio.get<Object?>(
        'https://remotive.com/api/remote-jobs',
        queryParameters: const {'limit': 1},
      );
      return response.statusCode == 200;
    } on DioException {
      return false;
    }
  }
}

class HimalayasJobSource implements JobSource {
  HimalayasJobSource({required this._dio, DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final Dio _dio;
  final DateTime Function() _now;

  @override
  String get id => 'himalayas';
  @override
  String get name => 'Himalayas';

  @override
  Future<List<Job>> search({
    required List<String> requiredKeywords,
    String? location,
  }) async {
    if (requiredKeywords.isEmpty) return const [];
    final all = <Job>[];
    for (var page = 1; page <= 5; page++) {
      final response = await _getWithRetry(
        _dio,
        'https://himalayas.app/jobs/api/search',
        queryParameters: {
          'q': requiredKeywords.first,
          'sort': 'recent',
          'page': page,
          'country': _countryCode(location),
        },
      );
      final body = response.data;
      if (body is! Map<String, dynamic> || body['jobs'] is! List) {
        throw const JobSourceException(
          SourceFailureKind.invalidResponse,
          'Himalayas returned an unexpected response.',
        );
      }
      final pageJobs = (body['jobs'] as List)
          .whereType<Map<String, dynamic>>()
          .map(_parseHimalayas)
          .whereType<Job>()
          .toList();
      all.addAll(pageJobs);
      if (pageJobs.length < 20) break;
    }
    return _filter(all, requiredKeywords, location);
  }

  Job? _parseHimalayas(Map<String, dynamic> data) {
    final title = _text(data['title']);
    final applicationUrl = _validWebUrl(data['applicationLink']);
    final listingUrl = _validWebUrl(data['url']) ?? applicationUrl;
    if (title.isEmpty || applicationUrl == null || listingUrl == null) {
      return null;
    }
    final restrictions = _stringList(data['locationRestrictions']);
    final timezoneRestrictions = _stringList(data['timezoneRestrictions']);
    final publishedAt = _secondsToDate(data['pubDate']);
    final idValue = _text(data['guid']).isEmpty
        ? applicationUrl
        : _text(data['guid']);
    final reference = JobSourceReference(
      sourceId: id,
      sourceName: name,
      sourceJobId: idValue,
      originalUrl: listingUrl,
    );
    return Job(
      id: '$id:$idValue',
      sourceId: id,
      sourceName: name,
      sourceJobId: idValue,
      title: title,
      company: _text(data['companyName']),
      description: _plainText(_text(data['description'])),
      location: restrictions.isEmpty
          ? 'Remote (eligibility unspecified)'
          : restrictions.join(', '),
      country: restrictions.length == 1 ? restrictions.single : null,
      workArrangement: WorkArrangement.remote,
      employmentType: _text(data['employmentType']),
      salaryMin: _number(data['minSalary']),
      salaryMax: _number(data['maxSalary']),
      salaryCurrency: _nullableText(data['currency']),
      experienceLevel: _nullableText(data['seniority']),
      requiredSkills: const [],
      publishedAt: publishedAt,
      discoveredAt: _now(),
      applicationUrl: applicationUrl,
      originalSourceUrl: listingUrl,
      eligibleCountries: restrictions,
      timeZoneRequirement: timezoneRestrictions.isEmpty
          ? null
          : timezoneRestrictions.join(', '),
      sourceReferences: [reference],
    );
  }

  @override
  Future<bool> isAvailable() async {
    try {
      final response = await _dio.get<Object?>(
        'https://himalayas.app/jobs/api/search',
        queryParameters: const {'q': 'jobs', 'page': 1},
      );
      return response.statusCode == 200;
    } on DioException {
      return false;
    }
  }
}

Future<Response<Object?>> _getWithRetry(
  Dio dio,
  String url, {
  Map<String, Object?>? queryParameters,
}) async {
  for (var attempt = 0; attempt < 3; attempt++) {
    try {
      return await dio
          .get<Object?>(url, queryParameters: queryParameters)
          .timeout(const Duration(seconds: 20));
    } on DioException catch (error) {
      final status = error.response?.statusCode;
      if (status == 401 || status == 403) {
        throw const JobSourceException(
          SourceFailureKind.authentication,
          'This source rejected the request.',
        );
      }
      if (status == 429) {
        throw const JobSourceException(
          SourceFailureKind.rateLimited,
          'This source rate limited the request. Try again later.',
        );
      }
      final retryable = status == null || status >= 500;
      if (!retryable || attempt == 2) {
        throw JobSourceException(
          SourceFailureKind.network,
          'Could not reach ${Uri.tryParse(url)?.host ?? 'the source'}: ${error.message ?? 'request failed'}.',
        );
      }
      await Future<void>.delayed(Duration(milliseconds: 400 * (1 << attempt)));
    } on Exception catch (error) {
      if (attempt == 2) {
        throw JobSourceException(
          SourceFailureKind.network,
          'Network request failed: $error',
        );
      }
      await Future<void>.delayed(Duration(milliseconds: 400 * (1 << attempt)));
    }
  }
  throw const JobSourceException(
    SourceFailureKind.network,
    'Request failed after retries.',
  );
}

List<Job> _filter(List<Job> jobs, List<String> required, String? location) {
  final matcher = const KeywordMatcher();
  final result = <Job>[];
  for (final job in jobs) {
    final match = matcher.match(
      title: job.title,
      description: job.description,
      required: required,
    );
    if (!match.accepted) continue;
    final requestedLocation = location?.trim().toLowerCase();
    if (requestedLocation != null &&
        requestedLocation.isNotEmpty &&
        !job.location.toLowerCase().contains(requestedLocation) &&
        !job.eligibleCountries.any((country) {
          final normalizedCountry = country.toLowerCase();
          return normalizedCountry == requestedLocation ||
              normalizedCountry == 'worldwide' ||
              (requestedLocation == 'romania' && normalizedCountry == 'ro');
        })) {
      continue;
    }
    result.add(job.copyWith(matchedRequiredKeywords: match.matchedRequired));
  }
  return result;
}

String? _validWebUrl(Object? value) {
  if (value is! String) return null;
  final uri = Uri.tryParse(value);
  if (uri == null ||
      !uri.hasAuthority ||
      uri.host.isEmpty ||
      !const {'http', 'https'}.contains(uri.scheme.toLowerCase())) {
    return null;
  }
  return uri.toString();
}

String _plainText(String value) =>
    JobText.normalizeWhitespace(html_parser.parseFragment(value).text ?? '');

String _text(Object? value) => value?.toString().trim() ?? '';

String? _nullableText(Object? value) {
  final text = _text(value);
  return text.isEmpty ? null : text;
}

String _normalizeEmployment(String value) => switch (value.toLowerCase()) {
  'full_time' => 'Full-time',
  'part_time' => 'Part-time',
  'contract' => 'Contract',
  'freelance' => 'Freelance',
  'internship' => 'Internship',
  _ => value,
};

List<String> _stringList(Object? value) => value is List
    ? value.map((entry) => entry.toString()).toList(growable: false)
    : const [];

double? _number(Object? value) => value is num ? value.toDouble() : null;

(double?, double?, String?) _parseSalary(String value) {
  if (value.isEmpty) return (null, null, null);
  final currency = RegExp(
    r'\b(USD|EUR|GBP|RON|CAD|AUD)\b',
    caseSensitive: false,
  ).firstMatch(value)?.group(1)?.toUpperCase();
  final values = RegExp(r'\d[\d,]*(?:\.\d+)?')
      .allMatches(value)
      .map((match) => double.tryParse(match.group(0)!.replaceAll(',', '')))
      .whereType<double>()
      .toList();
  return (
    values.isEmpty ? null : values.first,
    values.length < 2 ? null : values[1],
    currency,
  );
}

DateTime? _secondsToDate(Object? value) {
  if (value is num) {
    return DateTime.fromMillisecondsSinceEpoch(
      value.toInt() * 1000,
      isUtc: true,
    );
  }
  return null;
}

String? _countryCode(String? location) {
  if (location == null) return null;
  final value = location.trim().toLowerCase();
  return switch (value) {
    'romania' => 'RO',
    'germany' => 'DE',
    'france' => 'FR',
    'united kingdom' => 'GB',
    'uk' => 'GB',
    'united states' => 'US',
    'usa' => 'US',
    _ when RegExp(r'^[a-z]{2}$').hasMatch(value) => value.toUpperCase(),
    _ => null,
  };
}
