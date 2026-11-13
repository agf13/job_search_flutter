import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html_parser;

import '../../../core/utils/job_text.dart';
import '../../jobs/domain/job.dart';
import '../../keywords/domain/keyword_matcher.dart';
import '../domain/job_source.dart';

class AdzunaJobSource implements JobSource {
  AdzunaJobSource({
    required this._dio,
    required this.appId,
    required this.appKey,
    String countryCode = 'ro',
    this.now = DateTime.now,
  }) : countryCode = _validatedCountryCode(countryCode);

  final Dio _dio;
  final String appId;
  final String appKey;
  final String countryCode;
  final DateTime Function() now;

  @override
  String get id => 'adzuna_$countryCode';
  @override
  String get name => 'Adzuna (${countryCode.toUpperCase()})';

  @override
  Future<List<Job>> search({
    required List<String> requiredKeywords,
    String? location,
  }) async {
    if (requiredKeywords.isEmpty) return const [];
    final jobs = <Job>[];
    for (var page = 1; page <= 3; page++) {
      final response = await _requestWithRetry(
        () => _dio.get<Object?>(
          'https://api.adzuna.com/v1/api/jobs/$countryCode/search/$page',
          queryParameters: {
            'app_id': appId,
            'app_key': appKey,
            'what': requiredKeywords.join(' '),
            'where': ?location,
            'results_per_page': 50,
            'content-type': 'application/json',
          },
        ),
      );
      final body = response.data;
      if (body is! Map<String, dynamic> || body['results'] is! List) {
        throw const JobSourceException(
          SourceFailureKind.invalidResponse,
          'Adzuna returned an unexpected response.',
        );
      }
      final pageJobs = (body['results'] as List)
          .whereType<Map<String, dynamic>>()
          .map((item) => _parseAdzuna(item, now()))
          .whereType<Job>()
          .toList();
      jobs.addAll(pageJobs);
      if (pageJobs.length < 50) break;
    }
    return _strictlyMatch(jobs, requiredKeywords);
  }

  Job? _parseAdzuna(Map<String, dynamic> item, DateTime discoveredAt) {
    final url = _webUrl(item['redirect_url']);
    final title = _string(item['title']);
    if (url == null || title.isEmpty) return null;
    final location = item['location'];
    final company = item['company'];
    final sourceId = item['id']?.toString();
    final description = _plainText(_string(item['description']));
    return Job(
      id: 'adzuna:$sourceId',
      sourceId: id,
      sourceName: name,
      sourceJobId: sourceId,
      title: title,
      company: company is Map ? _string(company['display_name']) : '',
      description: description,
      location: location is Map ? _string(location['display_name']) : '',
      country: countryCode.toUpperCase(),
      workArrangement: _arrangement('$title $description'),
      employmentType: _string(item['contract_type']),
      salaryMin: _numeric(item['salary_min']),
      salaryMax: _numeric(item['salary_max']),
      salaryCurrency: _currency(countryCode),
      publishedAt: DateTime.tryParse(_string(item['created'])),
      discoveredAt: discoveredAt,
      applicationUrl: url,
      originalSourceUrl: url,
      sourceReferences: [
        JobSourceReference(
          sourceId: id,
          sourceName: name,
          sourceJobId: sourceId,
          originalUrl: url,
        ),
      ],
    );
  }

  @override
  Future<bool> isAvailable() async {
    try {
      final result = await _dio.get<Object?>(
        'https://api.adzuna.com/v1/api/jobs/$countryCode/search/1',
        queryParameters: {
          'app_id': appId,
          'app_key': appKey,
          'what': 'jobs',
          'results_per_page': 1,
          'content-type': 'application/json',
        },
      );
      return result.statusCode == 200;
    } on DioException {
      return false;
    }
  }
}

class JoobleJobSource implements JobSource {
  JoobleJobSource({
    required this._dio,
    required this.apiKey,
    String countryCode = 'ro',
    this.now = DateTime.now,
  }) : countryCode = _validatedCountryCode(countryCode);

  final Dio _dio;
  final String apiKey;
  final String countryCode;
  final DateTime Function() now;

  @override
  String get id => 'jooble_$countryCode';
  @override
  String get name => 'Jooble (${countryCode.toUpperCase()})';

  @override
  Future<List<Job>> search({
    required List<String> requiredKeywords,
    String? location,
  }) async {
    if (requiredKeywords.isEmpty) return const [];
    final response = await _requestWithRetry(
      () => _dio.post<Object?>(
        'https://$countryCode.jooble.org/api/$apiKey',
        data: {
          'keywords': requiredKeywords.join(' '),
          'location': location ?? _countryName(countryCode),
          'page': '1',
          'ResultOnPage': 100,
        },
      ),
    );
    final body = response.data;
    if (body is! Map<String, dynamic> || body['jobs'] is! List) {
      throw const JobSourceException(
        SourceFailureKind.invalidResponse,
        'Jooble returned an unexpected response.',
      );
    }
    return _strictlyMatch(
      (body['jobs'] as List)
          .whereType<Map<String, dynamic>>()
          .map((item) => _parseJooble(item, now()))
          .whereType<Job>()
          .toList(),
      requiredKeywords,
    );
  }

  Job? _parseJooble(Map<String, dynamic> item, DateTime discoveredAt) {
    final url = _webUrl(item['link']);
    final title = _string(item['title']);
    if (url == null || title.isEmpty) return null;
    final idValue = item['id']?.toString();
    final salary = _parseSalary(_string(item['salary']));
    final description = _plainText(_string(item['snippet']));
    return Job(
      id: 'jooble:$countryCode:${idValue ?? url}',
      sourceId: id,
      sourceName: name,
      sourceJobId: idValue,
      title: title,
      company: _string(item['company']),
      description: description,
      location: _string(item['location']),
      country: countryCode.toUpperCase(),
      workArrangement: _arrangement('$title $description'),
      employmentType: _string(item['type']),
      salaryMin: salary.$1,
      salaryMax: salary.$2,
      salaryCurrency: salary.$3 ?? _currency(countryCode),
      publishedAt: DateTime.tryParse(_string(item['updated'])),
      discoveredAt: discoveredAt,
      applicationUrl: url,
      originalSourceUrl: url,
      sourceReferences: [
        JobSourceReference(
          sourceId: id,
          sourceName: name,
          sourceJobId: idValue,
          originalUrl: url,
        ),
      ],
    );
  }

  @override
  Future<bool> isAvailable() async {
    try {
      final response = await _dio.post<Object?>(
        'https://$countryCode.jooble.org/api/$apiKey',
        data: {'keywords': 'jobs', 'location': _countryName(countryCode)},
      );
      return response.statusCode == 200;
    } on DioException {
      return false;
    }
  }
}

Future<Response<Object?>> _requestWithRetry(
  Future<Response<Object?>> Function() request,
) async {
  for (var attempt = 0; attempt < 3; attempt++) {
    try {
      return await request().timeout(const Duration(seconds: 20));
    } on DioException catch (error) {
      final status = error.response?.statusCode;
      if (status == 401 || status == 403) {
        throw const JobSourceException(
          SourceFailureKind.authentication,
          'The configured API credentials were rejected.',
        );
      }
      if (status == 429) {
        throw const JobSourceException(
          SourceFailureKind.rateLimited,
          'The source API request limit has been reached.',
        );
      }
      if ((status != null && status < 500) || attempt == 2) {
        throw JobSourceException(
          SourceFailureKind.network,
          'Source request failed. Check the connection and try again.',
        );
      }
      await Future<void>.delayed(Duration(milliseconds: 400 * (1 << attempt)));
    } on Exception {
      if (attempt == 2) {
        throw JobSourceException(
          SourceFailureKind.network,
          'Source request failed. Check the connection and try again.',
        );
      }
      await Future<void>.delayed(Duration(milliseconds: 400 * (1 << attempt)));
    }
  }
  throw const JobSourceException(
    SourceFailureKind.network,
    'Source request failed after retries.',
  );
}

List<Job> _strictlyMatch(List<Job> jobs, List<String> required) {
  const matcher = KeywordMatcher();
  return jobs
      .map((job) {
        final result = matcher.match(
          title: job.title,
          description: job.description,
          required: required,
        );
        return result.accepted
            ? job.copyWith(matchedRequiredKeywords: result.matchedRequired)
            : null;
      })
      .whereType<Job>()
      .toList(growable: false);
}

String? _webUrl(Object? value) {
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

String _string(Object? value) => value?.toString().trim() ?? '';

double? _numeric(Object? value) => value is num ? value.toDouble() : null;

String _plainText(String value) =>
    JobText.normalizeWhitespace(html_parser.parseFragment(value).text ?? '');

WorkArrangement _arrangement(String text) {
  final normalized = text.toLowerCase();
  if (normalized.contains('hybrid')) return WorkArrangement.hybrid;
  if (normalized.contains('remote') || normalized.contains('work from home')) {
    return WorkArrangement.remote;
  }
  if (normalized.contains('on-site') || normalized.contains('onsite')) {
    return WorkArrangement.onSite;
  }
  return WorkArrangement.unspecified;
}

String? _currency(String countryCode) => switch (countryCode.toLowerCase()) {
  'ro' => 'RON',
  'gb' => 'GBP',
  'us' => 'USD',
  'ca' => 'CAD',
  'au' => 'AUD',
  'in' => 'INR',
  'pl' => 'PLN',
  'za' => 'ZAR',
  'nz' => 'NZD',
  _ => 'EUR',
};

(double?, double?, String?) _parseSalary(String value) {
  final amounts = RegExp(r'\d[\d,]*(?:\.\d+)?')
      .allMatches(value)
      .map((match) => double.tryParse(match.group(0)!.replaceAll(',', '')))
      .whereType<double>()
      .toList();
  final upper = value.toUpperCase();
  final currency = upper.contains('EUR') || value.contains('€')
      ? 'EUR'
      : upper.contains('GBP') || value.contains('£')
      ? 'GBP'
      : upper.contains('USD') || value.contains(r'$')
      ? 'USD'
      : upper.contains('RON') || upper.contains('LEI')
      ? 'RON'
      : null;
  return (
    amounts.isEmpty ? null : amounts.first,
    amounts.length < 2 ? null : amounts[1],
    currency,
  );
}

String _countryName(String code) => switch (code.toLowerCase()) {
  'ro' => 'Romania',
  'gb' => 'United Kingdom',
  'de' => 'Germany',
  'fr' => 'France',
  'us' => 'United States',
  _ => code.toUpperCase(),
};

String _validatedCountryCode(String value) {
  final normalized = value.trim().toLowerCase();
  if (!RegExp(r'^[a-z]{2}$').hasMatch(normalized)) {
    throw ArgumentError.value(
      value,
      'countryCode',
      'Use a two-letter country code.',
    );
  }
  return normalized;
}
