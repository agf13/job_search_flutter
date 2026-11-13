import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_search/core/database/app_database.dart';
import 'package:job_search/features/jobs/data/drift_job_repository.dart';
import 'package:job_search/features/jobs/domain/job.dart';

void main() {
  late AppDatabase database;
  late DriftJobRepository repository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    repository = DriftJobRepository(database);
  });

  tearDown(() async => database.close());

  test('stores jobs, favorites, application status and exports JSON', () async {
    final first = Job(
      id: 'one',
      sourceId: 'remotive',
      sourceName: 'Remotive',
      sourceJobId: '42',
      title: 'Designer',
      company: 'Acme',
      description: 'Figma role',
      location: 'Remote',
      workArrangement: WorkArrangement.remote,
      salaryMin: 50000,
      salaryMax: 70000,
      salaryCurrency: 'EUR',
      discoveredAt: DateTime.utc(2026, 11),
      publishedAt: DateTime.utc(2026, 10),
      applicationUrl: 'https://careers.acme.example/role',
      originalSourceUrl: 'https://remotive.com/role/42',
      matchedRequiredKeywords: const ['Designer', 'Figma'],
      sourceReferences: const [
        JobSourceReference(
          sourceId: 'remotive',
          sourceName: 'Remotive',
          sourceJobId: '42',
          originalUrl: 'https://remotive.com/role/42',
        ),
      ],
    );
    final second = Job(
      id: 'two',
      sourceId: 'himalayas',
      sourceName: 'Himalayas',
      title: 'Analyst',
      description: 'Data role',
      location: 'Romania',
      originalSourceUrl: 'https://jobs.example/analyst',
      discoveredAt: DateTime.utc(2026, 11),
    );
    await repository.saveJobs([first, second]);
    await repository.setFavorite('one', true);
    await repository.setApplicationStatus('one', ApplicationStatus.applied);

    final restored = await repository.watchJobs().first;
    expect(restored, hasLength(2));
    expect(restored.first.salaryMin, 50000);
    expect(restored.first.sourceReferences.single.sourceName, 'Remotive');
    expect(restored.first.applicationStatus, ApplicationStatus.applied);
    expect(restored.first.matchedRequiredKeywords, ['Designer', 'Figma']);
    expect(jsonDecode(await repository.exportJson()), hasLength(2));

    await repository.clearCachedJobs();
    final remaining = await repository.watchJobs().first;
    expect(remaining, hasLength(1));
    expect(remaining.single.isFavorite, isTrue);
  });
}
