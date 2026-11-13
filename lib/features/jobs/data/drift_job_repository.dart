import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/job.dart';
import '../domain/job_repository.dart';

class DriftJobRepository implements JobRepository {
  const DriftJobRepository(this.database);
  final AppDatabase database;

  @override
  Stream<List<Job>> watchJobs() => database.watchAllJobs().map(
    (rows) => rows.map(_fromRow).toList(growable: false),
  );

  @override
  Future<List<Job>> getJobs() async =>
      (await database.getAllJobs()).map(_fromRow).toList(growable: false);

  @override
  Future<void> saveJobs(Iterable<Job> jobs) =>
      database.saveJobs(jobs.map(_toCompanion));

  @override
  Future<void> reconcileJobs({
    required Iterable<Job> jobs,
    required Set<String> removeIds,
  }) async {
    await database.transaction(() async {
      await database.saveJobs(jobs.map(_toCompanion));
      await database.removeJobs(removeIds);
    });
  }

  @override
  Future<void> setFavorite(String id, bool favorite) =>
      database.setFavorite(id, favorite);

  @override
  Future<void> setApplicationStatus(String id, ApplicationStatus status) =>
      database.setApplicationStatus(id, status.name);

  @override
  Future<void> clearCachedJobs() async {
    await database.clearCachedJobs();
  }

  @override
  Future<String> exportJson() async {
    final rows = await database.getAllJobs();
    return const JsonEncoder.withIndent(
      '  ',
    ).convert(rows.map(_toJson).toList());
  }

  JobRecordsCompanion _toCompanion(Job job) => JobRecordsCompanion.insert(
    id: job.id,
    sourceId: job.sourceId,
    sourceName: job.sourceName,
    sourceJobId: Value(job.sourceJobId),
    title: job.title,
    company: job.company,
    description: job.description,
    location: job.location,
    country: Value(job.country),
    workArrangement: job.workArrangement.name,
    employmentType: Value(job.employmentType),
    salaryMin: Value(job.salaryMin?.toDouble()),
    salaryMax: Value(job.salaryMax?.toDouble()),
    salaryCurrency: Value(job.salaryCurrency),
    experienceLevel: Value(job.experienceLevel),
    requiredSkillsJson: jsonEncode(job.requiredSkills),
    publishedAt: Value(job.publishedAt),
    discoveredAt: job.discoveredAt,
    applicationUrl: Value(job.applicationUrl),
    companyCareerUrl: Value(job.companyCareerUrl),
    originalSourceUrl: job.originalSourceUrl,
    isFavorite: Value(job.isFavorite),
    applicationStatus: job.applicationStatus.name,
    relevanceScore: Value(job.relevanceScore),
    matchedRequiredJson: jsonEncode(job.matchedRequiredKeywords),
    matchedOptionalJson: jsonEncode(job.matchedOptionalKeywords),
    sourceReferencesJson: jsonEncode(
      job.sourceReferences.map(_sourceReferenceToJson).toList(),
    ),
    eligibleCountriesJson: jsonEncode(job.eligibleCountries),
    timeZoneRequirement: Value(job.timeZoneRequirement),
  );

  Job _fromRow(JobRecord row) => Job(
    id: row.id,
    sourceId: row.sourceId,
    sourceName: row.sourceName,
    sourceJobId: row.sourceJobId,
    title: row.title,
    company: row.company,
    description: row.description,
    location: row.location,
    country: row.country,
    workArrangement: WorkArrangement.values.byNameOr(
      row.workArrangement,
      WorkArrangement.unspecified,
    ),
    employmentType: row.employmentType,
    salaryMin: row.salaryMin,
    salaryMax: row.salaryMax,
    salaryCurrency: row.salaryCurrency,
    experienceLevel: row.experienceLevel,
    requiredSkills: _stringList(row.requiredSkillsJson),
    publishedAt: row.publishedAt,
    discoveredAt: row.discoveredAt,
    applicationUrl: row.applicationUrl,
    companyCareerUrl: row.companyCareerUrl,
    originalSourceUrl: row.originalSourceUrl,
    isFavorite: row.isFavorite,
    applicationStatus: ApplicationStatus.values.byNameOr(
      row.applicationStatus,
      ApplicationStatus.newListing,
    ),
    relevanceScore: row.relevanceScore,
    matchedRequiredKeywords: _stringList(row.matchedRequiredJson),
    matchedOptionalKeywords: _stringList(row.matchedOptionalJson),
    sourceReferences: _sourceReferences(row.sourceReferencesJson),
    eligibleCountries: _stringList(row.eligibleCountriesJson),
    timeZoneRequirement: row.timeZoneRequirement,
  );

  Map<String, Object?> _toJson(JobRecord row) => {
    'id': row.id,
    'sourceId': row.sourceId,
    'sourceName': row.sourceName,
    'sourceJobId': row.sourceJobId,
    'title': row.title,
    'company': row.company,
    'description': row.description,
    'location': row.location,
    'country': row.country,
    'workArrangement': row.workArrangement,
    'employmentType': row.employmentType,
    'salaryMin': row.salaryMin,
    'salaryMax': row.salaryMax,
    'salaryCurrency': row.salaryCurrency,
    'experienceLevel': row.experienceLevel,
    'requiredSkills': jsonDecode(row.requiredSkillsJson),
    'publishedAt': row.publishedAt?.toIso8601String(),
    'discoveredAt': row.discoveredAt.toIso8601String(),
    'applicationUrl': row.applicationUrl,
    'companyCareerUrl': row.companyCareerUrl,
    'originalSourceUrl': row.originalSourceUrl,
    'isFavorite': row.isFavorite,
    'applicationStatus': row.applicationStatus,
    'relevanceScore': row.relevanceScore,
    'matchedRequiredKeywords': jsonDecode(row.matchedRequiredJson),
    'matchedOptionalKeywords': jsonDecode(row.matchedOptionalJson),
    'sourceReferences': jsonDecode(row.sourceReferencesJson),
    'eligibleCountries': jsonDecode(row.eligibleCountriesJson),
    'timeZoneRequirement': row.timeZoneRequirement,
  };

  Map<String, Object?> _sourceReferenceToJson(JobSourceReference ref) => {
    'sourceId': ref.sourceId,
    'sourceName': ref.sourceName,
    'sourceJobId': ref.sourceJobId,
    'originalUrl': ref.originalUrl,
    'isEmployerOwned': ref.isEmployerOwned,
  };

  List<JobSourceReference> _sourceReferences(String encoded) {
    final value = jsonDecode(encoded);
    if (value is! List) return const [];
    return value
        .whereType<Map<String, dynamic>>()
        .map(
          (row) => JobSourceReference(
            sourceId: row['sourceId'] as String? ?? '',
            sourceName: row['sourceName'] as String? ?? '',
            sourceJobId: row['sourceJobId'] as String?,
            originalUrl: row['originalUrl'] as String? ?? '',
            isEmployerOwned: row['isEmployerOwned'] as bool? ?? false,
          ),
        )
        .toList();
  }

  List<String> _stringList(String encoded) {
    final value = jsonDecode(encoded);
    return value is List ? value.whereType<String>().toList() : const [];
  }
}

extension _EnumByNameOr<T extends Enum> on List<T> {
  T byNameOr(String name, T fallback) {
    for (final value in this) {
      if (value.name == name) return value;
    }
    return fallback;
  }
}
