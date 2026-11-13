import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../jobs/domain/job.dart';
import '../../jobs/domain/job_deduplicator.dart';
import '../../jobs/domain/job_repository.dart';
import '../../keywords/domain/keyword_matcher.dart';
import '../../link_inspection/domain/link_inspector.dart';
import '../../filters/domain/location_filter.dart';
import 'job_source.dart';

enum SourceSyncStatus {
  success,
  noMatches,
  failed,
  authenticationError,
  rateLimited,
  unavailable,
  deferredRefresh,
  skippedNoKeywords,
}

class SourceSyncOutcome {
  const SourceSyncOutcome({
    required this.sourceId,
    required this.sourceName,
    required this.status,
    required this.matchCount,
    this.message,
    this.invalidLinkCount = 0,
  });

  final String sourceId;
  final String sourceName;
  final SourceSyncStatus status;
  final int matchCount;
  final int invalidLinkCount;
  final String? message;
}

class SourceSyncResult {
  const SourceSyncResult({required this.jobs, required this.sources});
  final List<Job> jobs;
  final List<SourceSyncOutcome> sources;
}

class SourceSyncService {
  const SourceSyncService({
    required this.sources,
    required this.repository,
    required this.database,
    this.deduplicator = const JobDeduplicator(),
    this.now = DateTime.now,
  });

  final List<JobSource> sources;
  final JobRepository repository;
  final AppDatabase database;
  final JobDeduplicator deduplicator;
  final DateTime Function() now;

  Future<SourceSyncResult> synchronize(JobSearchCriteria criteria) async {
    if (criteria.requiredKeywords.isEmpty ||
        criteria.requiredKeywords.every((term) => term.trim().isEmpty)) {
      return SourceSyncResult(
        jobs: const [],
        sources: sources
            .map(
              (source) => SourceSyncOutcome(
                sourceId: source.id,
                sourceName: source.name,
                status: SourceSyncStatus.skippedNoKeywords,
                matchCount: 0,
                message: 'Add at least one required keyword to search.',
              ),
            )
            .toList(),
      );
    }

    final outcomes = await Future.wait(
      sources.map((source) => _synchronizeSource(source, criteria)),
    );
    final found = outcomes.expand((outcome) => outcome.jobs).toList();
    final existing = await repository.getJobs();
    final merged = deduplicator.deduplicate([...existing, ...found]);
    final mergedIds = merged.map((job) => job.id).toSet();
    final removeIds = existing
        .map((job) => job.id)
        .where((id) => !mergedIds.contains(id))
        .toSet();
    await repository.reconcileJobs(jobs: merged, removeIds: removeIds);
    final visible = _filterStored(merged, criteria);
    return SourceSyncResult(
      jobs: visible,
      sources: outcomes.map((outcome) => outcome.outcome).toList(),
    );
  }

  Future<_SourceRun> _synchronizeSource(
    JobSource source,
    JobSearchCriteria criteria,
  ) async {
    final previous = await database.getSourceSetting(source.id);
    final minimumRefreshInterval =
        source.id == 'remotive' || source.id.startsWith('adzuna_')
        ? const Duration(hours: 6)
        : source.id == 'himalayas'
        ? const Duration(hours: 24)
        : source.id.startsWith('jooble_')
        ? const Duration(minutes: 45)
        : null;
    if (minimumRefreshInterval != null &&
        previous?.lastSynchronizedAt != null) {
      final elapsed = now().difference(previous!.lastSynchronizedAt!);
      if (elapsed < minimumRefreshInterval) {
        final remaining = minimumRefreshInterval - elapsed;
        return _SourceRun(
          SourceSyncOutcome(
            sourceId: source.id,
            sourceName: source.name,
            status: source.id == 'remotive' || source.id.startsWith('jooble_')
                ? SourceSyncStatus.rateLimited
                : SourceSyncStatus.deferredRefresh,
            matchCount: 0,
            message:
                'Using locally cached listings. Refresh is available again in ${remaining.inHours}h.',
          ),
          const [],
        );
      }
    }

    try {
      await database.saveSourceSetting(
        SourceSettingsCompanion.insert(
          id: source.id,
          isEnabled: Value(previous?.isEnabled ?? true),
          configurationJson: previous?.configurationJson ?? '{}',
          lastSynchronizedAt: Value(now()),
          lastStatus: const Value('syncing'),
          lastError: const Value(null),
        ),
      );
      final fetched = await source.search(
        requiredKeywords: criteria.requiredKeywords,
        location: criteria.location,
      );
      final matcher = KeywordMatcher(
        ignoreCase: criteria.ignoreCase,
        ignoreRomanianDiacritics: criteria.ignoreRomanianDiacritics,
      );
      var invalidLinks = 0;
      final accepted = <Job>[];
      for (final job in fetched) {
        if (!LinkInspector.inspect(job.originalSourceUrl).valid) {
          invalidLinks++;
          continue;
        }
        final match = matcher.match(
          title: job.title,
          description: job.description,
          required: criteria.requiredKeywords,
          groups: criteria.groups,
          optional: criteria.optionalKeywords,
          excluded: criteria.excludedKeywords,
        );
        if (!match.accepted) continue;
        accepted.add(
          job.copyWith(
            matchedRequiredKeywords: match.matchedRequired,
            matchedOptionalKeywords: match.matchedOptional,
            relevanceScore: match.relevanceScore,
          ),
        );
      }
      final successfulAt = now();
      await database.saveSourceSetting(
        SourceSettingsCompanion.insert(
          id: source.id,
          isEnabled: const Value(true),
          configurationJson: '{}',
          lastSynchronizedAt: Value(successfulAt),
          lastStatus: Value(accepted.isEmpty ? 'noMatches' : 'success'),
          lastError: const Value(null),
        ),
      );
      return _SourceRun(
        SourceSyncOutcome(
          sourceId: source.id,
          sourceName: source.name,
          status: accepted.isEmpty
              ? SourceSyncStatus.noMatches
              : SourceSyncStatus.success,
          matchCount: accepted.length,
          invalidLinkCount: invalidLinks,
          message: invalidLinks == 0
              ? null
              : '$invalidLinks listing(s) were rejected because their original link was invalid.',
        ),
        accepted,
      );
    } on JobSourceException catch (error) {
      final status = switch (error.kind) {
        SourceFailureKind.authentication =>
          SourceSyncStatus.authenticationError,
        SourceFailureKind.rateLimited => SourceSyncStatus.rateLimited,
        SourceFailureKind.unavailable => SourceSyncStatus.unavailable,
        SourceFailureKind.network ||
        SourceFailureKind.invalidResponse => SourceSyncStatus.failed,
      };
      await _saveFailure(source, error.message, status.name);
      return _SourceRun(
        SourceSyncOutcome(
          sourceId: source.id,
          sourceName: source.name,
          status: status,
          matchCount: 0,
          message: error.message,
        ),
        const [],
      );
    } catch (error) {
      await _saveFailure(source, error.toString(), 'failed');
      return _SourceRun(
        SourceSyncOutcome(
          sourceId: source.id,
          sourceName: source.name,
          status: SourceSyncStatus.failed,
          matchCount: 0,
          message: error.toString(),
        ),
        const [],
      );
    }
  }

  Future<void> _saveFailure(
    JobSource source,
    String error,
    String status,
  ) async {
    final previous = await database.getSourceSetting(source.id);
    await database.saveSourceSetting(
      SourceSettingsCompanion.insert(
        id: source.id,
        isEnabled: Value(previous?.isEnabled ?? true),
        configurationJson: '{}',
        lastSynchronizedAt: Value(previous?.lastSynchronizedAt),
        lastStatus: Value(status),
        lastError: Value(error),
      ),
    );
  }

  List<Job> _filterStored(List<Job> jobs, JobSearchCriteria criteria) {
    final matcher = KeywordMatcher(
      ignoreCase: criteria.ignoreCase,
      ignoreRomanianDiacritics: criteria.ignoreRomanianDiacritics,
    );
    return jobs
        .where((job) {
          if (!LinkInspector.inspect(job.originalSourceUrl).valid) {
            return false;
          }
          final result = matcher.match(
            title: job.title,
            description: job.description,
            required: criteria.requiredKeywords,
            groups: criteria.groups,
            excluded: criteria.excludedKeywords,
          );
          if (!result.accepted) return false;
          if (!JobLocationFilter.matches(job, criteria.locations)) return false;
          final location = criteria.location?.trim().toLowerCase();
          return location == null ||
              location.isEmpty ||
              job.location.toLowerCase().contains(location) ||
              job.eligibleCountries.any(
                (country) => country.toLowerCase() == location,
              );
        })
        .map((job) {
          final result = matcher.match(
            title: job.title,
            description: job.description,
            required: criteria.requiredKeywords,
            groups: criteria.groups,
            optional: criteria.optionalKeywords,
            excluded: criteria.excludedKeywords,
          );
          return job.copyWith(
            matchedRequiredKeywords: result.matchedRequired,
            matchedOptionalKeywords: result.matchedOptional,
            relevanceScore: result.relevanceScore,
          );
        })
        .toList(growable: false);
  }
}

class _SourceRun {
  const _SourceRun(this.outcome, this.jobs);
  final SourceSyncOutcome outcome;
  final List<Job> jobs;
}
