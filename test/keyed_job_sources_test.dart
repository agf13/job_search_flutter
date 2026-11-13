import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_search/features/sources/data/keyed_job_sources.dart';

class _KeyedAdapter implements HttpClientAdapter {
  _KeyedAdapter(this.responseBody);
  final Object responseBody;
  late RequestOptions request;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    request = options;
    return ResponseBody.fromString(
      jsonEncode(responseBody),
      200,
      headers: const {
        'content-type': ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test(
    'Adzuna parses salary and enforces all required terms locally',
    () async {
      final adapter = _KeyedAdapter({
        'results': [
          {
            'id': 'adz-1',
            'title': 'Restaurant manager',
            'company': {'display_name': 'Bistro'},
            'description': '<p>English speaking and team leadership.</p>',
            'location': {'display_name': 'Bucharest, Romania'},
            'redirect_url': 'https://adzuna.example/redirect/adz-1',
            'created': '2026-10-30T10:00:00Z',
            'salary_min': 4500,
            'salary_max': 6500,
            'contract_type': 'permanent',
          },
          {
            'id': 'adz-2',
            'title': 'Restaurant manager',
            'company': {'display_name': 'Other'},
            'description': '<p>Team leadership.</p>',
            'location': {'display_name': 'Bucharest, Romania'},
            'redirect_url': 'https://adzuna.example/redirect/adz-2',
          },
        ],
      });
      final source = AdzunaJobSource(
        dio: Dio()..httpClientAdapter = adapter,
        appId: 'user-app-id',
        appKey: 'user-app-key',
        now: () => DateTime.utc(2026, 11, 1),
      );

      final jobs = await source.search(
        requiredKeywords: ['manager', 'English', 'leadership'],
        location: 'Bucharest',
      );

      expect(jobs, hasLength(1));
      expect(jobs.single.company, 'Bistro');
      expect(jobs.single.salaryMin, 4500);
      expect(jobs.single.salaryCurrency, 'RON');
      expect(jobs.single.originalSourceUrl, contains('adz-1'));
      expect(adapter.request.queryParameters['app_key'], 'user-app-key');
    },
  );

  test('Jooble parses regional results and salary data', () async {
    final adapter = _KeyedAdapter({
      'totalCount': 1,
      'jobs': [
        {
          'id': 777,
          'title': 'Bucatar',
          'location': 'Cluj-Napoca, Romania',
          'snippet': '<p>Preparati feluri de mancare.</p>',
          'salary': '5000 - 6500 RON',
          'source': 'Employer',
          'type': 'Full-time',
          'link': 'https://employer.example/jobs/777',
          'company': 'Restaurant',
        },
      ],
    });
    final source = JoobleJobSource(
      dio: Dio()..httpClientAdapter = adapter,
      apiKey: 'user-jooble-key',
      countryCode: 'ro',
      now: () => DateTime.utc(2026, 11, 1),
    );

    final jobs = await source.search(
      requiredKeywords: ['Bucatar', 'feluri de mancare'],
    );

    expect(jobs, hasLength(1));
    expect(jobs.single.company, 'Restaurant');
    expect(jobs.single.salaryMin, 5000);
    expect(jobs.single.salaryCurrency, 'RON');
    expect(jobs.single.originalSourceUrl, 'https://employer.example/jobs/777');
    expect(adapter.request.uri.host, 'ro.jooble.org');
    expect(adapter.request.data['location'], 'Romania');
  });

  test('rejects an invalid Jooble country code before building a URL', () {
    expect(
      () => JoobleJobSource(
        dio: Dio(),
        apiKey: 'private-key',
        countryCode: 'ro.example',
      ),
      throwsArgumentError,
    );
  });
}
