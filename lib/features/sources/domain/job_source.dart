import '../../jobs/domain/job.dart';

enum SourceFailureKind {
  unavailable,
  authentication,
  rateLimited,
  network,
  invalidResponse,
}

class JobSourceException implements Exception {
  const JobSourceException(this.kind, this.message);
  final SourceFailureKind kind;
  final String message;

  @override
  String toString() => message;
}

abstract interface class JobSource {
  String get id;
  String get name;

  Future<List<Job>> search({
    required List<String> requiredKeywords,
    String? location,
  });

  Future<bool> isAvailable();
}
