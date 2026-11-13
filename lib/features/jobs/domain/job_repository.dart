import 'job.dart';

abstract interface class JobRepository {
  Stream<List<Job>> watchJobs();
  Future<List<Job>> getJobs();
  Future<void> saveJobs(Iterable<Job> jobs);
  Future<void> reconcileJobs({
    required Iterable<Job> jobs,
    required Set<String> removeIds,
  });
  Future<void> setFavorite(String id, bool favorite);
  Future<void> setApplicationStatus(String id, ApplicationStatus status);
  Future<void> clearCachedJobs();
  Future<String> exportJson();
}
