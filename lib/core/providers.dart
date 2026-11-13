import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database/app_database.dart';
import '../features/jobs/data/drift_job_repository.dart';
import '../features/jobs/domain/job_repository.dart';
import '../features/jobs/domain/job.dart';
import '../features/sources/data/api_job_sources.dart';
import '../features/sources/domain/job_source.dart';
import '../features/sources/domain/source_sync_service.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 25),
      sendTimeout: const Duration(seconds: 12),
      responseType: ResponseType.json,
      headers: const {'Accept': 'application/json'},
    ),
  );
  ref.onDispose(dio.close);
  return dio;
});

final jobRepositoryProvider = Provider<JobRepository>(
  (ref) => DriftJobRepository(ref.watch(appDatabaseProvider)),
);

final jobSourcesProvider = Provider<List<JobSource>>((ref) {
  final dio = ref.watch(dioProvider);
  return [RemotiveJobSource(dio: dio), HimalayasJobSource(dio: dio)];
});

final sourceSyncServiceProvider = Provider<SourceSyncService>((ref) {
  return SourceSyncService(
    sources: ref.watch(jobSourcesProvider),
    repository: ref.watch(jobRepositoryProvider),
    database: ref.watch(appDatabaseProvider),
  );
});

final storedJobsProvider = StreamProvider<List<Job>>(
  (ref) => ref.watch(jobRepositoryProvider).watchJobs(),
);
