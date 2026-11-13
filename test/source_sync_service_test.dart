import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_search/core/database/app_database.dart';
import 'package:job_search/features/jobs/data/drift_job_repository.dart';
import 'package:job_search/features/jobs/domain/job.dart';
import 'package:job_search/features/keywords/domain/keyword_matcher.dart';
import 'package:job_search/features/sources/domain/job_source.dart';
import 'package:job_search/features/sources/domain/source_sync_service.dart';

class _MemorySource implements JobSource {
  _MemorySource(this.id, this.jobs, {this.error});
  @override
  final String id;
  final List<Job> jobs;
  final JobSourceException? error;
  int calls = 0;

  @override
  String get name => id;

  @override
  Future<bool> isAvailable() async => error == null;

  @override
  Future<List<Job>> search({
    required List<String> requiredKeywords,
    String? location,
  }) async {
    calls++;
    if (error case final failure?) throw failure;
    return jobs;
  }
}

Job _job({
  required String id,
  required String title,
  required String description,
  String url = 'https://jobs.example/role',
}) => Job(
  id: id,
  sourceId: 'test',
  sourceName: 'Test',
  title: title,
  description: description,
  originalSourceUrl: url,
  discoveredAt: DateTime.utc(2026, 11, 1),
);

void main() {
  late AppDatabase database;
  late DriftJobRepository repository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    repository = DriftJobRepository(database);
  });

  tearDown(() async => database.close());

  test('enforces strict keywords and excluded terms before storage', () async {
    final source = _MemorySource('test', [
      _job(
        id: 'pass',
        title: 'Designer',
        description: 'Figma and English are needed.',
      ),
      _job(
        id: 'missing',
        title: 'Designer',
        description: 'Figma only.',
        url: 'https://jobs.example/missing',
      ),
      _job(
        id: 'excluded',
        title: 'Designer',
        description: 'Figma, English, unpaid role.',
        url: 'https://jobs.example/excluded',
      ),
    ]);
    final service = SourceSyncService(
      sources: [source],
      repository: repository,
      database: database,
    );

    final result = await service.synchronize(
      const JobSearchCriteria(
        requiredKeywords: ['Designer', 'Figma', 'English'],
        excludedKeywords: ['unpaid'],
      ),
    );

    expect(result.jobs.map((job) => job.id), ['pass']);
    expect(result.sources.single.status, SourceSyncStatus.success);
    expect((await repository.getJobs()).map((job) => job.id), ['pass']);
  });

  test('a failed source does not stop another source succeeding', () async {
    final failed = _MemorySource(
      'failed',
      const [],
      error: const JobSourceException(SourceFailureKind.network, 'offline'),
    );
    final working = _MemorySource('working', [
      _job(id: 'pass', title: 'Cook', description: 'Prepare meals.'),
    ]);
    final service = SourceSyncService(
      sources: [failed, working],
      repository: repository,
      database: database,
    );

    final result = await service.synchronize(
      const JobSearchCriteria(requiredKeywords: ['Cook', 'meals']),
    );

    expect(result.sources.map((source) => source.status), [
      SourceSyncStatus.failed,
      SourceSyncStatus.success,
    ]);
    expect(result.jobs, hasLength(1));
    expect(failed.calls, 1);
    expect(working.calls, 1);
  });

  test(
    'a listing with an invalid original URL is never stored or displayed',
    () async {
      final source = _MemorySource('unsafe', [
        _job(
          id: 'invalid',
          title: 'Cook',
          description: 'Prepare meals.',
          url: 'javascript:alert(1)',
        ),
      ]);
      final service = SourceSyncService(
        sources: [source],
        repository: repository,
        database: database,
      );
      final result = await service.synchronize(
        const JobSearchCriteria(requiredKeywords: ['Cook']),
      );

      expect(result.jobs, isEmpty);
      expect(result.sources.single.status, SourceSyncStatus.noMatches);
      expect(result.sources.single.invalidLinkCount, 1);
      expect(await repository.getJobs(), isEmpty);
    },
  );

  test('does not contact any source without required keywords', () async {
    final source = _MemorySource('test', const []);
    final service = SourceSyncService(
      sources: [source],
      repository: repository,
      database: database,
    );
    final result = await service.synchronize(const JobSearchCriteria());
    expect(source.calls, 0);
    expect(result.sources.single.status, SourceSyncStatus.skippedNoKeywords);
  });

  test('persists source refresh windows and reuses cached listings', () async {
    var current = DateTime.utc(2026, 11, 1);
    final source = _MemorySource('remotive', [
      _job(id: 'remote', title: 'Cook', description: 'Prepare meals.'),
    ]);
    final service = SourceSyncService(
      sources: [source],
      repository: repository,
      database: database,
      now: () => current,
    );
    const criteria = JobSearchCriteria(requiredKeywords: ['Cook', 'meals']);

    final initial = await service.synchronize(criteria);
    current = current.add(const Duration(hours: 2));
    final cached = await service.synchronize(criteria);

    expect(initial.jobs, hasLength(1));
    expect(cached.jobs, hasLength(1));
    expect(cached.sources.single.status, SourceSyncStatus.rateLimited);
    expect(source.calls, 1);
  });
}
