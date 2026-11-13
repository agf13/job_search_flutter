import 'job.dart';

class JobDeduplicator {
  const JobDeduplicator();

  List<Job> deduplicate(Iterable<Job> input) {
    final result = <Job>[];
    final keys = <String, int>{};
    for (final job in input) {
      final key = _key(job);
      final existingIndex = keys[key];
      if (existingIndex == null) {
        keys[key] = result.length;
        result.add(_withReference(job));
      } else {
        result[existingIndex] = _merge(result[existingIndex], job);
      }
    }
    return result;
  }

  Job _withReference(Job job) {
    if (job.sourceReferences.isNotEmpty) return job;
    return job.copyWith(
      sourceReferences: [
        JobSourceReference(
          sourceId: job.sourceId,
          sourceName: job.sourceName,
          sourceJobId: job.sourceJobId,
          originalUrl: job.originalSourceUrl,
        ),
      ],
    );
  }

  String _key(Job job) {
    if (job.sourceJobId != null && job.sourceJobId!.isNotEmpty) {
      return 'source:${job.sourceId}:${job.sourceJobId}';
    }
    final normalizedUrl = job.applicationUrl == null
        ? null
        : Uri.tryParse(job.applicationUrl!)?.replace(fragment: '').toString();
    if (normalizedUrl != null && normalizedUrl.isNotEmpty) {
      return 'url:${normalizedUrl.toLowerCase()}';
    }
    return 'fallback:${_normalize(job.company)}:${_normalize(job.title)}:${_normalize(job.location)}';
  }

  Job _merge(Job primary, Job duplicate) {
    final refs = <String, JobSourceReference>{};
    for (final ref in [
      ...primary.sourceReferences,
      ..._withReference(duplicate).sourceReferences,
    ]) {
      refs['${ref.sourceId}:${ref.sourceJobId}:${ref.originalUrl}'] = ref;
    }
    JobSourceReference? employerRef;
    for (final ref in refs.values) {
      if (ref.isEmployerOwned) {
        employerRef = ref;
        break;
      }
    }
    final applicationUrl =
        employerRef?.originalUrl ??
        primary.applicationUrl ??
        duplicate.applicationUrl;
    return primary.copyWith(
      applicationUrl: applicationUrl,
      companyCareerUrl: primary.companyCareerUrl ?? duplicate.companyCareerUrl,
      sourceReferences: refs.values.toList(),
      isFavorite: primary.isFavorite || duplicate.isFavorite,
      applicationStatus:
          primary.applicationStatus == ApplicationStatus.newListing
          ? duplicate.applicationStatus
          : primary.applicationStatus,
    );
  }

  String _normalize(String value) => value
      .toLowerCase()
      .trim()
      .replaceAll(RegExp(r'\s+'), ' ')
      .replaceAll(RegExp(r'[^\p{L}\p{N} ]', unicode: true), '');
}
