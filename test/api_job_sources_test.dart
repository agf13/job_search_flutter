import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_search/features/sources/data/api_job_sources.dart';
import 'package:job_search/features/sources/domain/job_source.dart';

class _JsonAdapter implements HttpClientAdapter {
  _JsonAdapter(this.responses);
  final Map<String, Object?> responses;
  int requests = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests++;
    final body = responses[options.uri.path] ?? const {'jobs': <Object>[]};
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: const {
        'content-type': ['application/json; charset=utf-8'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test(
    'Remotive parses jobs and strictly matches title and description',
    () async {
      final adapter = _JsonAdapter({
        '/api/remote-jobs': {
          'jobs': [
            {
              'id': 17,
              'url': 'https://remotive.com/remote-jobs/design/role-17',
              'title': 'Product Designer',
              'company_name': 'Acme',
              'candidate_required_location': 'Romania, Europe',
              'description': '<p>Use Figma and speak English.</p>',
              'job_type': 'full_time',
              'publication_date': '2026-10-01T09:00:00Z',
              'salary': 'USD 80,000 - 100,000',
            },
            {
              'id': 18,
              'url': 'https://remotive.com/remote-jobs/design/role-18',
              'title': 'Product Designer',
              'description': '<p>Use Figma.</p>',
            },
          ],
        },
      });
      final now = DateTime.utc(2026, 11, 1);
      final source = RemotiveJobSource(
        dio: Dio()..httpClientAdapter = adapter,
        now: () => now,
      );

      final jobs = await source.search(
        requiredKeywords: ['Designer', 'Figma', 'English'],
        location: 'Romania',
      );

      expect(jobs, hasLength(1));
      expect(jobs.single.title, 'Product Designer');
      expect(jobs.single.description, 'Use Figma and speak English.');
      expect(jobs.single.workArrangement.name, 'remote');
      expect(jobs.single.salaryCurrency, 'USD');
      expect(jobs.single.matchedRequiredKeywords, [
        'Designer',
        'Figma',
        'English',
      ]);
      expect(adapter.requests, 1);

      await source.search(requiredKeywords: ['Designer']);
      expect(adapter.requests, 1, reason: 'Remotive is cached for six hours.');
    },
  );

  test('Himalayas preserves eligibility and application URL', () async {
    final adapter = _JsonAdapter({
      '/jobs/api/search': {
        'jobs': [
          {
            'guid': 'acme-product-designer',
            'title': 'Product Designer',
            'companyName': 'Acme',
            'employmentType': 'Full Time',
            'locationRestrictions': ['Romania', 'Germany'],
            'timezoneRestrictions': ['UTC+02:00'],
            'description': '<p>Figma and English are required.</p>',
            'minSalary': 50000,
            'maxSalary': 70000,
            'currency': 'EUR',
            'pubDate': 1790845200,
            'applicationLink': 'https://careers.acme.example/role/1',
          },
        ],
      },
    });
    final source = HimalayasJobSource(
      dio: Dio()..httpClientAdapter = adapter,
      now: () => DateTime.utc(2026, 11, 1),
    );

    final jobs = await source.search(
      requiredKeywords: ['Designer', 'Figma', 'English'],
      location: 'Romania',
    );

    expect(jobs, hasLength(1));
    expect(jobs.single.applicationUrl, 'https://careers.acme.example/role/1');
    expect(jobs.single.originalSourceUrl, jobs.single.applicationUrl);
    expect(jobs.single.eligibleCountries, ['Romania', 'Germany']);
    expect(jobs.single.timeZoneRequirement, 'UTC+02:00');
    expect(jobs.single.salaryCurrency, 'EUR');
  });

  test(
    'a failed/malformed source response is not treated as empty success',
    () async {
      final adapter = _JsonAdapter({
        '/api/remote-jobs': {'bad': true},
      });
      final source = RemotiveJobSource(dio: Dio()..httpClientAdapter = adapter);
      await expectLater(
        source.search(requiredKeywords: ['Designer']),
        throwsA(
          isA<JobSourceException>().having(
            (error) => error.kind,
            'failure kind',
            SourceFailureKind.invalidResponse,
          ),
        ),
      );
    },
  );
}
