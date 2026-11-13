import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class JobRecords extends Table {
  TextColumn get id => text()();
  TextColumn get sourceId => text()();
  TextColumn get sourceName => text()();
  TextColumn get sourceJobId => text().nullable()();
  TextColumn get title => text()();
  TextColumn get company => text()();
  TextColumn get description => text()();
  TextColumn get location => text()();
  TextColumn get country => text().nullable()();
  TextColumn get workArrangement => text()();
  TextColumn get employmentType => text().nullable()();
  RealColumn get salaryMin => real().nullable()();
  RealColumn get salaryMax => real().nullable()();
  TextColumn get salaryCurrency => text().nullable()();
  TextColumn get experienceLevel => text().nullable()();
  TextColumn get requiredSkillsJson => text()();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  DateTimeColumn get discoveredAt => dateTime()();
  TextColumn get applicationUrl => text().nullable()();
  TextColumn get companyCareerUrl => text().nullable()();
  TextColumn get originalSourceUrl => text()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  TextColumn get applicationStatus => text()();
  IntColumn get relevanceScore => integer().withDefault(const Constant(0))();
  TextColumn get matchedRequiredJson => text()();
  TextColumn get matchedOptionalJson => text()();
  TextColumn get sourceReferencesJson => text()();
  TextColumn get eligibleCountriesJson => text()();
  TextColumn get timeZoneRequirement => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class KeywordProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get configurationJson => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SourceSettings extends Table {
  TextColumn get id => text()();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(false))();
  TextColumn get configurationJson => text()();
  DateTimeColumn get lastSynchronizedAt => dateTime().nullable()();
  TextColumn get lastStatus => text().nullable()();
  TextColumn get lastError => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class LinkInspections extends Table {
  TextColumn get url => text()();
  TextColumn get hostname => text().nullable()();
  TextColumn get status => text()();
  TextColumn get warningsJson => text()();
  DateTimeColumn get inspectedAt => dateTime()();
  TextColumn get reputationStatus => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {url};
}

@DriftDatabase(
  tables: [JobRecords, KeywordProfiles, SourceSettings, LinkInspections],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'devjobs'));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 1) await m.createAll();
    },
  );

  Future<List<JobRecord>> getAllJobs() => select(jobRecords).get();

  Stream<List<JobRecord>> watchAllJobs() => select(jobRecords).watch();

  Future<void> saveJob(JobRecordsCompanion job) async {
    await into(jobRecords).insertOnConflictUpdate(job);
  }

  Future<void> saveJobs(Iterable<JobRecordsCompanion> jobs) async {
    await batch(
      (batch) => batch.insertAllOnConflictUpdate(jobRecords, jobs.toList()),
    );
  }

  Future<void> removeJobs(Set<String> ids) async {
    if (ids.isEmpty) return;
    await (delete(jobRecords)..where((row) => row.id.isIn(ids))).go();
  }

  Future<SourceSetting?> getSourceSetting(String id) => (select(
    sourceSettings,
  )..where((row) => row.id.equals(id))).getSingleOrNull();

  Future<void> saveSourceSetting(SourceSettingsCompanion setting) async {
    await into(sourceSettings).insertOnConflictUpdate(setting);
  }

  Future<void> setFavorite(String id, bool favorite) async {
    await (update(jobRecords)..where((row) => row.id.equals(id))).write(
      JobRecordsCompanion(isFavorite: Value(favorite)),
    );
  }

  Future<void> setApplicationStatus(String id, String status) async {
    await (update(jobRecords)..where((row) => row.id.equals(id))).write(
      JobRecordsCompanion(applicationStatus: Value(status)),
    );
  }

  Future<int> clearCachedJobs() async =>
      (delete(jobRecords)..where((row) => row.isFavorite.equals(false))).go();

  Future<List<JobRecord>> getFavorites() =>
      (select(jobRecords)..where((row) => row.isFavorite.equals(true))).get();
}
