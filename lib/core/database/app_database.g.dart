// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $JobRecordsTable extends JobRecords
    with TableInfo<$JobRecordsTable, JobRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceNameMeta = const VerificationMeta(
    'sourceName',
  );
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
    'source_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceJobIdMeta = const VerificationMeta(
    'sourceJobId',
  );
  @override
  late final GeneratedColumn<String> sourceJobId = GeneratedColumn<String>(
    'source_job_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyMeta = const VerificationMeta(
    'company',
  );
  @override
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
    'company',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workArrangementMeta = const VerificationMeta(
    'workArrangement',
  );
  @override
  late final GeneratedColumn<String> workArrangement = GeneratedColumn<String>(
    'work_arrangement',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _employmentTypeMeta = const VerificationMeta(
    'employmentType',
  );
  @override
  late final GeneratedColumn<String> employmentType = GeneratedColumn<String>(
    'employment_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _salaryMinMeta = const VerificationMeta(
    'salaryMin',
  );
  @override
  late final GeneratedColumn<double> salaryMin = GeneratedColumn<double>(
    'salary_min',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _salaryMaxMeta = const VerificationMeta(
    'salaryMax',
  );
  @override
  late final GeneratedColumn<double> salaryMax = GeneratedColumn<double>(
    'salary_max',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _salaryCurrencyMeta = const VerificationMeta(
    'salaryCurrency',
  );
  @override
  late final GeneratedColumn<String> salaryCurrency = GeneratedColumn<String>(
    'salary_currency',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _experienceLevelMeta = const VerificationMeta(
    'experienceLevel',
  );
  @override
  late final GeneratedColumn<String> experienceLevel = GeneratedColumn<String>(
    'experience_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _requiredSkillsJsonMeta =
      const VerificationMeta('requiredSkillsJson');
  @override
  late final GeneratedColumn<String> requiredSkillsJson =
      GeneratedColumn<String>(
        'required_skills_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _publishedAtMeta = const VerificationMeta(
    'publishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
    'published_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discoveredAtMeta = const VerificationMeta(
    'discoveredAt',
  );
  @override
  late final GeneratedColumn<DateTime> discoveredAt = GeneratedColumn<DateTime>(
    'discovered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _applicationUrlMeta = const VerificationMeta(
    'applicationUrl',
  );
  @override
  late final GeneratedColumn<String> applicationUrl = GeneratedColumn<String>(
    'application_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyCareerUrlMeta = const VerificationMeta(
    'companyCareerUrl',
  );
  @override
  late final GeneratedColumn<String> companyCareerUrl = GeneratedColumn<String>(
    'company_career_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalSourceUrlMeta = const VerificationMeta(
    'originalSourceUrl',
  );
  @override
  late final GeneratedColumn<String> originalSourceUrl =
      GeneratedColumn<String>(
        'original_source_url',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _applicationStatusMeta = const VerificationMeta(
    'applicationStatus',
  );
  @override
  late final GeneratedColumn<String> applicationStatus =
      GeneratedColumn<String>(
        'application_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _relevanceScoreMeta = const VerificationMeta(
    'relevanceScore',
  );
  @override
  late final GeneratedColumn<int> relevanceScore = GeneratedColumn<int>(
    'relevance_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _matchedRequiredJsonMeta =
      const VerificationMeta('matchedRequiredJson');
  @override
  late final GeneratedColumn<String> matchedRequiredJson =
      GeneratedColumn<String>(
        'matched_required_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _matchedOptionalJsonMeta =
      const VerificationMeta('matchedOptionalJson');
  @override
  late final GeneratedColumn<String> matchedOptionalJson =
      GeneratedColumn<String>(
        'matched_optional_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _sourceReferencesJsonMeta =
      const VerificationMeta('sourceReferencesJson');
  @override
  late final GeneratedColumn<String> sourceReferencesJson =
      GeneratedColumn<String>(
        'source_references_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _eligibleCountriesJsonMeta =
      const VerificationMeta('eligibleCountriesJson');
  @override
  late final GeneratedColumn<String> eligibleCountriesJson =
      GeneratedColumn<String>(
        'eligible_countries_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _timeZoneRequirementMeta =
      const VerificationMeta('timeZoneRequirement');
  @override
  late final GeneratedColumn<String> timeZoneRequirement =
      GeneratedColumn<String>(
        'time_zone_requirement',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sourceId,
    sourceName,
    sourceJobId,
    title,
    company,
    description,
    location,
    country,
    workArrangement,
    employmentType,
    salaryMin,
    salaryMax,
    salaryCurrency,
    experienceLevel,
    requiredSkillsJson,
    publishedAt,
    discoveredAt,
    applicationUrl,
    companyCareerUrl,
    originalSourceUrl,
    isFavorite,
    applicationStatus,
    relevanceScore,
    matchedRequiredJson,
    matchedOptionalJson,
    sourceReferencesJson,
    eligibleCountriesJson,
    timeZoneRequirement,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<JobRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('source_name')) {
      context.handle(
        _sourceNameMeta,
        sourceName.isAcceptableOrUnknown(data['source_name']!, _sourceNameMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('source_job_id')) {
      context.handle(
        _sourceJobIdMeta,
        sourceJobId.isAcceptableOrUnknown(
          data['source_job_id']!,
          _sourceJobIdMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('company')) {
      context.handle(
        _companyMeta,
        company.isAcceptableOrUnknown(data['company']!, _companyMeta),
      );
    } else if (isInserting) {
      context.missing(_companyMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('work_arrangement')) {
      context.handle(
        _workArrangementMeta,
        workArrangement.isAcceptableOrUnknown(
          data['work_arrangement']!,
          _workArrangementMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workArrangementMeta);
    }
    if (data.containsKey('employment_type')) {
      context.handle(
        _employmentTypeMeta,
        employmentType.isAcceptableOrUnknown(
          data['employment_type']!,
          _employmentTypeMeta,
        ),
      );
    }
    if (data.containsKey('salary_min')) {
      context.handle(
        _salaryMinMeta,
        salaryMin.isAcceptableOrUnknown(data['salary_min']!, _salaryMinMeta),
      );
    }
    if (data.containsKey('salary_max')) {
      context.handle(
        _salaryMaxMeta,
        salaryMax.isAcceptableOrUnknown(data['salary_max']!, _salaryMaxMeta),
      );
    }
    if (data.containsKey('salary_currency')) {
      context.handle(
        _salaryCurrencyMeta,
        salaryCurrency.isAcceptableOrUnknown(
          data['salary_currency']!,
          _salaryCurrencyMeta,
        ),
      );
    }
    if (data.containsKey('experience_level')) {
      context.handle(
        _experienceLevelMeta,
        experienceLevel.isAcceptableOrUnknown(
          data['experience_level']!,
          _experienceLevelMeta,
        ),
      );
    }
    if (data.containsKey('required_skills_json')) {
      context.handle(
        _requiredSkillsJsonMeta,
        requiredSkillsJson.isAcceptableOrUnknown(
          data['required_skills_json']!,
          _requiredSkillsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requiredSkillsJsonMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
        _publishedAtMeta,
        publishedAt.isAcceptableOrUnknown(
          data['published_at']!,
          _publishedAtMeta,
        ),
      );
    }
    if (data.containsKey('discovered_at')) {
      context.handle(
        _discoveredAtMeta,
        discoveredAt.isAcceptableOrUnknown(
          data['discovered_at']!,
          _discoveredAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_discoveredAtMeta);
    }
    if (data.containsKey('application_url')) {
      context.handle(
        _applicationUrlMeta,
        applicationUrl.isAcceptableOrUnknown(
          data['application_url']!,
          _applicationUrlMeta,
        ),
      );
    }
    if (data.containsKey('company_career_url')) {
      context.handle(
        _companyCareerUrlMeta,
        companyCareerUrl.isAcceptableOrUnknown(
          data['company_career_url']!,
          _companyCareerUrlMeta,
        ),
      );
    }
    if (data.containsKey('original_source_url')) {
      context.handle(
        _originalSourceUrlMeta,
        originalSourceUrl.isAcceptableOrUnknown(
          data['original_source_url']!,
          _originalSourceUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_originalSourceUrlMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('application_status')) {
      context.handle(
        _applicationStatusMeta,
        applicationStatus.isAcceptableOrUnknown(
          data['application_status']!,
          _applicationStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_applicationStatusMeta);
    }
    if (data.containsKey('relevance_score')) {
      context.handle(
        _relevanceScoreMeta,
        relevanceScore.isAcceptableOrUnknown(
          data['relevance_score']!,
          _relevanceScoreMeta,
        ),
      );
    }
    if (data.containsKey('matched_required_json')) {
      context.handle(
        _matchedRequiredJsonMeta,
        matchedRequiredJson.isAcceptableOrUnknown(
          data['matched_required_json']!,
          _matchedRequiredJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_matchedRequiredJsonMeta);
    }
    if (data.containsKey('matched_optional_json')) {
      context.handle(
        _matchedOptionalJsonMeta,
        matchedOptionalJson.isAcceptableOrUnknown(
          data['matched_optional_json']!,
          _matchedOptionalJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_matchedOptionalJsonMeta);
    }
    if (data.containsKey('source_references_json')) {
      context.handle(
        _sourceReferencesJsonMeta,
        sourceReferencesJson.isAcceptableOrUnknown(
          data['source_references_json']!,
          _sourceReferencesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourceReferencesJsonMeta);
    }
    if (data.containsKey('eligible_countries_json')) {
      context.handle(
        _eligibleCountriesJsonMeta,
        eligibleCountriesJson.isAcceptableOrUnknown(
          data['eligible_countries_json']!,
          _eligibleCountriesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_eligibleCountriesJsonMeta);
    }
    if (data.containsKey('time_zone_requirement')) {
      context.handle(
        _timeZoneRequirementMeta,
        timeZoneRequirement.isAcceptableOrUnknown(
          data['time_zone_requirement']!,
          _timeZoneRequirementMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      )!,
      sourceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_name'],
      )!,
      sourceJobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_job_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      company: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      workArrangement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work_arrangement'],
      )!,
      employmentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}employment_type'],
      ),
      salaryMin: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salary_min'],
      ),
      salaryMax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salary_max'],
      ),
      salaryCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}salary_currency'],
      ),
      experienceLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}experience_level'],
      ),
      requiredSkillsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}required_skills_json'],
      )!,
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}published_at'],
      ),
      discoveredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}discovered_at'],
      )!,
      applicationUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}application_url'],
      ),
      companyCareerUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_career_url'],
      ),
      originalSourceUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_source_url'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      applicationStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}application_status'],
      )!,
      relevanceScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}relevance_score'],
      )!,
      matchedRequiredJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}matched_required_json'],
      )!,
      matchedOptionalJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}matched_optional_json'],
      )!,
      sourceReferencesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_references_json'],
      )!,
      eligibleCountriesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}eligible_countries_json'],
      )!,
      timeZoneRequirement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time_zone_requirement'],
      ),
    );
  }

  @override
  $JobRecordsTable createAlias(String alias) {
    return $JobRecordsTable(attachedDatabase, alias);
  }
}

class JobRecord extends DataClass implements Insertable<JobRecord> {
  final String id;
  final String sourceId;
  final String sourceName;
  final String? sourceJobId;
  final String title;
  final String company;
  final String description;
  final String location;
  final String? country;
  final String workArrangement;
  final String? employmentType;
  final double? salaryMin;
  final double? salaryMax;
  final String? salaryCurrency;
  final String? experienceLevel;
  final String requiredSkillsJson;
  final DateTime? publishedAt;
  final DateTime discoveredAt;
  final String? applicationUrl;
  final String? companyCareerUrl;
  final String originalSourceUrl;
  final bool isFavorite;
  final String applicationStatus;
  final int relevanceScore;
  final String matchedRequiredJson;
  final String matchedOptionalJson;
  final String sourceReferencesJson;
  final String eligibleCountriesJson;
  final String? timeZoneRequirement;
  const JobRecord({
    required this.id,
    required this.sourceId,
    required this.sourceName,
    this.sourceJobId,
    required this.title,
    required this.company,
    required this.description,
    required this.location,
    this.country,
    required this.workArrangement,
    this.employmentType,
    this.salaryMin,
    this.salaryMax,
    this.salaryCurrency,
    this.experienceLevel,
    required this.requiredSkillsJson,
    this.publishedAt,
    required this.discoveredAt,
    this.applicationUrl,
    this.companyCareerUrl,
    required this.originalSourceUrl,
    required this.isFavorite,
    required this.applicationStatus,
    required this.relevanceScore,
    required this.matchedRequiredJson,
    required this.matchedOptionalJson,
    required this.sourceReferencesJson,
    required this.eligibleCountriesJson,
    this.timeZoneRequirement,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['source_id'] = Variable<String>(sourceId);
    map['source_name'] = Variable<String>(sourceName);
    if (!nullToAbsent || sourceJobId != null) {
      map['source_job_id'] = Variable<String>(sourceJobId);
    }
    map['title'] = Variable<String>(title);
    map['company'] = Variable<String>(company);
    map['description'] = Variable<String>(description);
    map['location'] = Variable<String>(location);
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    map['work_arrangement'] = Variable<String>(workArrangement);
    if (!nullToAbsent || employmentType != null) {
      map['employment_type'] = Variable<String>(employmentType);
    }
    if (!nullToAbsent || salaryMin != null) {
      map['salary_min'] = Variable<double>(salaryMin);
    }
    if (!nullToAbsent || salaryMax != null) {
      map['salary_max'] = Variable<double>(salaryMax);
    }
    if (!nullToAbsent || salaryCurrency != null) {
      map['salary_currency'] = Variable<String>(salaryCurrency);
    }
    if (!nullToAbsent || experienceLevel != null) {
      map['experience_level'] = Variable<String>(experienceLevel);
    }
    map['required_skills_json'] = Variable<String>(requiredSkillsJson);
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<DateTime>(publishedAt);
    }
    map['discovered_at'] = Variable<DateTime>(discoveredAt);
    if (!nullToAbsent || applicationUrl != null) {
      map['application_url'] = Variable<String>(applicationUrl);
    }
    if (!nullToAbsent || companyCareerUrl != null) {
      map['company_career_url'] = Variable<String>(companyCareerUrl);
    }
    map['original_source_url'] = Variable<String>(originalSourceUrl);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['application_status'] = Variable<String>(applicationStatus);
    map['relevance_score'] = Variable<int>(relevanceScore);
    map['matched_required_json'] = Variable<String>(matchedRequiredJson);
    map['matched_optional_json'] = Variable<String>(matchedOptionalJson);
    map['source_references_json'] = Variable<String>(sourceReferencesJson);
    map['eligible_countries_json'] = Variable<String>(eligibleCountriesJson);
    if (!nullToAbsent || timeZoneRequirement != null) {
      map['time_zone_requirement'] = Variable<String>(timeZoneRequirement);
    }
    return map;
  }

  JobRecordsCompanion toCompanion(bool nullToAbsent) {
    return JobRecordsCompanion(
      id: Value(id),
      sourceId: Value(sourceId),
      sourceName: Value(sourceName),
      sourceJobId: sourceJobId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceJobId),
      title: Value(title),
      company: Value(company),
      description: Value(description),
      location: Value(location),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      workArrangement: Value(workArrangement),
      employmentType: employmentType == null && nullToAbsent
          ? const Value.absent()
          : Value(employmentType),
      salaryMin: salaryMin == null && nullToAbsent
          ? const Value.absent()
          : Value(salaryMin),
      salaryMax: salaryMax == null && nullToAbsent
          ? const Value.absent()
          : Value(salaryMax),
      salaryCurrency: salaryCurrency == null && nullToAbsent
          ? const Value.absent()
          : Value(salaryCurrency),
      experienceLevel: experienceLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(experienceLevel),
      requiredSkillsJson: Value(requiredSkillsJson),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      discoveredAt: Value(discoveredAt),
      applicationUrl: applicationUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(applicationUrl),
      companyCareerUrl: companyCareerUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(companyCareerUrl),
      originalSourceUrl: Value(originalSourceUrl),
      isFavorite: Value(isFavorite),
      applicationStatus: Value(applicationStatus),
      relevanceScore: Value(relevanceScore),
      matchedRequiredJson: Value(matchedRequiredJson),
      matchedOptionalJson: Value(matchedOptionalJson),
      sourceReferencesJson: Value(sourceReferencesJson),
      eligibleCountriesJson: Value(eligibleCountriesJson),
      timeZoneRequirement: timeZoneRequirement == null && nullToAbsent
          ? const Value.absent()
          : Value(timeZoneRequirement),
    );
  }

  factory JobRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobRecord(
      id: serializer.fromJson<String>(json['id']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      sourceJobId: serializer.fromJson<String?>(json['sourceJobId']),
      title: serializer.fromJson<String>(json['title']),
      company: serializer.fromJson<String>(json['company']),
      description: serializer.fromJson<String>(json['description']),
      location: serializer.fromJson<String>(json['location']),
      country: serializer.fromJson<String?>(json['country']),
      workArrangement: serializer.fromJson<String>(json['workArrangement']),
      employmentType: serializer.fromJson<String?>(json['employmentType']),
      salaryMin: serializer.fromJson<double?>(json['salaryMin']),
      salaryMax: serializer.fromJson<double?>(json['salaryMax']),
      salaryCurrency: serializer.fromJson<String?>(json['salaryCurrency']),
      experienceLevel: serializer.fromJson<String?>(json['experienceLevel']),
      requiredSkillsJson: serializer.fromJson<String>(
        json['requiredSkillsJson'],
      ),
      publishedAt: serializer.fromJson<DateTime?>(json['publishedAt']),
      discoveredAt: serializer.fromJson<DateTime>(json['discoveredAt']),
      applicationUrl: serializer.fromJson<String?>(json['applicationUrl']),
      companyCareerUrl: serializer.fromJson<String?>(json['companyCareerUrl']),
      originalSourceUrl: serializer.fromJson<String>(json['originalSourceUrl']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      applicationStatus: serializer.fromJson<String>(json['applicationStatus']),
      relevanceScore: serializer.fromJson<int>(json['relevanceScore']),
      matchedRequiredJson: serializer.fromJson<String>(
        json['matchedRequiredJson'],
      ),
      matchedOptionalJson: serializer.fromJson<String>(
        json['matchedOptionalJson'],
      ),
      sourceReferencesJson: serializer.fromJson<String>(
        json['sourceReferencesJson'],
      ),
      eligibleCountriesJson: serializer.fromJson<String>(
        json['eligibleCountriesJson'],
      ),
      timeZoneRequirement: serializer.fromJson<String?>(
        json['timeZoneRequirement'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sourceId': serializer.toJson<String>(sourceId),
      'sourceName': serializer.toJson<String>(sourceName),
      'sourceJobId': serializer.toJson<String?>(sourceJobId),
      'title': serializer.toJson<String>(title),
      'company': serializer.toJson<String>(company),
      'description': serializer.toJson<String>(description),
      'location': serializer.toJson<String>(location),
      'country': serializer.toJson<String?>(country),
      'workArrangement': serializer.toJson<String>(workArrangement),
      'employmentType': serializer.toJson<String?>(employmentType),
      'salaryMin': serializer.toJson<double?>(salaryMin),
      'salaryMax': serializer.toJson<double?>(salaryMax),
      'salaryCurrency': serializer.toJson<String?>(salaryCurrency),
      'experienceLevel': serializer.toJson<String?>(experienceLevel),
      'requiredSkillsJson': serializer.toJson<String>(requiredSkillsJson),
      'publishedAt': serializer.toJson<DateTime?>(publishedAt),
      'discoveredAt': serializer.toJson<DateTime>(discoveredAt),
      'applicationUrl': serializer.toJson<String?>(applicationUrl),
      'companyCareerUrl': serializer.toJson<String?>(companyCareerUrl),
      'originalSourceUrl': serializer.toJson<String>(originalSourceUrl),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'applicationStatus': serializer.toJson<String>(applicationStatus),
      'relevanceScore': serializer.toJson<int>(relevanceScore),
      'matchedRequiredJson': serializer.toJson<String>(matchedRequiredJson),
      'matchedOptionalJson': serializer.toJson<String>(matchedOptionalJson),
      'sourceReferencesJson': serializer.toJson<String>(sourceReferencesJson),
      'eligibleCountriesJson': serializer.toJson<String>(eligibleCountriesJson),
      'timeZoneRequirement': serializer.toJson<String?>(timeZoneRequirement),
    };
  }

  JobRecord copyWith({
    String? id,
    String? sourceId,
    String? sourceName,
    Value<String?> sourceJobId = const Value.absent(),
    String? title,
    String? company,
    String? description,
    String? location,
    Value<String?> country = const Value.absent(),
    String? workArrangement,
    Value<String?> employmentType = const Value.absent(),
    Value<double?> salaryMin = const Value.absent(),
    Value<double?> salaryMax = const Value.absent(),
    Value<String?> salaryCurrency = const Value.absent(),
    Value<String?> experienceLevel = const Value.absent(),
    String? requiredSkillsJson,
    Value<DateTime?> publishedAt = const Value.absent(),
    DateTime? discoveredAt,
    Value<String?> applicationUrl = const Value.absent(),
    Value<String?> companyCareerUrl = const Value.absent(),
    String? originalSourceUrl,
    bool? isFavorite,
    String? applicationStatus,
    int? relevanceScore,
    String? matchedRequiredJson,
    String? matchedOptionalJson,
    String? sourceReferencesJson,
    String? eligibleCountriesJson,
    Value<String?> timeZoneRequirement = const Value.absent(),
  }) => JobRecord(
    id: id ?? this.id,
    sourceId: sourceId ?? this.sourceId,
    sourceName: sourceName ?? this.sourceName,
    sourceJobId: sourceJobId.present ? sourceJobId.value : this.sourceJobId,
    title: title ?? this.title,
    company: company ?? this.company,
    description: description ?? this.description,
    location: location ?? this.location,
    country: country.present ? country.value : this.country,
    workArrangement: workArrangement ?? this.workArrangement,
    employmentType: employmentType.present
        ? employmentType.value
        : this.employmentType,
    salaryMin: salaryMin.present ? salaryMin.value : this.salaryMin,
    salaryMax: salaryMax.present ? salaryMax.value : this.salaryMax,
    salaryCurrency: salaryCurrency.present
        ? salaryCurrency.value
        : this.salaryCurrency,
    experienceLevel: experienceLevel.present
        ? experienceLevel.value
        : this.experienceLevel,
    requiredSkillsJson: requiredSkillsJson ?? this.requiredSkillsJson,
    publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
    discoveredAt: discoveredAt ?? this.discoveredAt,
    applicationUrl: applicationUrl.present
        ? applicationUrl.value
        : this.applicationUrl,
    companyCareerUrl: companyCareerUrl.present
        ? companyCareerUrl.value
        : this.companyCareerUrl,
    originalSourceUrl: originalSourceUrl ?? this.originalSourceUrl,
    isFavorite: isFavorite ?? this.isFavorite,
    applicationStatus: applicationStatus ?? this.applicationStatus,
    relevanceScore: relevanceScore ?? this.relevanceScore,
    matchedRequiredJson: matchedRequiredJson ?? this.matchedRequiredJson,
    matchedOptionalJson: matchedOptionalJson ?? this.matchedOptionalJson,
    sourceReferencesJson: sourceReferencesJson ?? this.sourceReferencesJson,
    eligibleCountriesJson: eligibleCountriesJson ?? this.eligibleCountriesJson,
    timeZoneRequirement: timeZoneRequirement.present
        ? timeZoneRequirement.value
        : this.timeZoneRequirement,
  );
  JobRecord copyWithCompanion(JobRecordsCompanion data) {
    return JobRecord(
      id: data.id.present ? data.id.value : this.id,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sourceName: data.sourceName.present
          ? data.sourceName.value
          : this.sourceName,
      sourceJobId: data.sourceJobId.present
          ? data.sourceJobId.value
          : this.sourceJobId,
      title: data.title.present ? data.title.value : this.title,
      company: data.company.present ? data.company.value : this.company,
      description: data.description.present
          ? data.description.value
          : this.description,
      location: data.location.present ? data.location.value : this.location,
      country: data.country.present ? data.country.value : this.country,
      workArrangement: data.workArrangement.present
          ? data.workArrangement.value
          : this.workArrangement,
      employmentType: data.employmentType.present
          ? data.employmentType.value
          : this.employmentType,
      salaryMin: data.salaryMin.present ? data.salaryMin.value : this.salaryMin,
      salaryMax: data.salaryMax.present ? data.salaryMax.value : this.salaryMax,
      salaryCurrency: data.salaryCurrency.present
          ? data.salaryCurrency.value
          : this.salaryCurrency,
      experienceLevel: data.experienceLevel.present
          ? data.experienceLevel.value
          : this.experienceLevel,
      requiredSkillsJson: data.requiredSkillsJson.present
          ? data.requiredSkillsJson.value
          : this.requiredSkillsJson,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
      discoveredAt: data.discoveredAt.present
          ? data.discoveredAt.value
          : this.discoveredAt,
      applicationUrl: data.applicationUrl.present
          ? data.applicationUrl.value
          : this.applicationUrl,
      companyCareerUrl: data.companyCareerUrl.present
          ? data.companyCareerUrl.value
          : this.companyCareerUrl,
      originalSourceUrl: data.originalSourceUrl.present
          ? data.originalSourceUrl.value
          : this.originalSourceUrl,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      applicationStatus: data.applicationStatus.present
          ? data.applicationStatus.value
          : this.applicationStatus,
      relevanceScore: data.relevanceScore.present
          ? data.relevanceScore.value
          : this.relevanceScore,
      matchedRequiredJson: data.matchedRequiredJson.present
          ? data.matchedRequiredJson.value
          : this.matchedRequiredJson,
      matchedOptionalJson: data.matchedOptionalJson.present
          ? data.matchedOptionalJson.value
          : this.matchedOptionalJson,
      sourceReferencesJson: data.sourceReferencesJson.present
          ? data.sourceReferencesJson.value
          : this.sourceReferencesJson,
      eligibleCountriesJson: data.eligibleCountriesJson.present
          ? data.eligibleCountriesJson.value
          : this.eligibleCountriesJson,
      timeZoneRequirement: data.timeZoneRequirement.present
          ? data.timeZoneRequirement.value
          : this.timeZoneRequirement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JobRecord(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('sourceJobId: $sourceJobId, ')
          ..write('title: $title, ')
          ..write('company: $company, ')
          ..write('description: $description, ')
          ..write('location: $location, ')
          ..write('country: $country, ')
          ..write('workArrangement: $workArrangement, ')
          ..write('employmentType: $employmentType, ')
          ..write('salaryMin: $salaryMin, ')
          ..write('salaryMax: $salaryMax, ')
          ..write('salaryCurrency: $salaryCurrency, ')
          ..write('experienceLevel: $experienceLevel, ')
          ..write('requiredSkillsJson: $requiredSkillsJson, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('discoveredAt: $discoveredAt, ')
          ..write('applicationUrl: $applicationUrl, ')
          ..write('companyCareerUrl: $companyCareerUrl, ')
          ..write('originalSourceUrl: $originalSourceUrl, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('applicationStatus: $applicationStatus, ')
          ..write('relevanceScore: $relevanceScore, ')
          ..write('matchedRequiredJson: $matchedRequiredJson, ')
          ..write('matchedOptionalJson: $matchedOptionalJson, ')
          ..write('sourceReferencesJson: $sourceReferencesJson, ')
          ..write('eligibleCountriesJson: $eligibleCountriesJson, ')
          ..write('timeZoneRequirement: $timeZoneRequirement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    sourceId,
    sourceName,
    sourceJobId,
    title,
    company,
    description,
    location,
    country,
    workArrangement,
    employmentType,
    salaryMin,
    salaryMax,
    salaryCurrency,
    experienceLevel,
    requiredSkillsJson,
    publishedAt,
    discoveredAt,
    applicationUrl,
    companyCareerUrl,
    originalSourceUrl,
    isFavorite,
    applicationStatus,
    relevanceScore,
    matchedRequiredJson,
    matchedOptionalJson,
    sourceReferencesJson,
    eligibleCountriesJson,
    timeZoneRequirement,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobRecord &&
          other.id == this.id &&
          other.sourceId == this.sourceId &&
          other.sourceName == this.sourceName &&
          other.sourceJobId == this.sourceJobId &&
          other.title == this.title &&
          other.company == this.company &&
          other.description == this.description &&
          other.location == this.location &&
          other.country == this.country &&
          other.workArrangement == this.workArrangement &&
          other.employmentType == this.employmentType &&
          other.salaryMin == this.salaryMin &&
          other.salaryMax == this.salaryMax &&
          other.salaryCurrency == this.salaryCurrency &&
          other.experienceLevel == this.experienceLevel &&
          other.requiredSkillsJson == this.requiredSkillsJson &&
          other.publishedAt == this.publishedAt &&
          other.discoveredAt == this.discoveredAt &&
          other.applicationUrl == this.applicationUrl &&
          other.companyCareerUrl == this.companyCareerUrl &&
          other.originalSourceUrl == this.originalSourceUrl &&
          other.isFavorite == this.isFavorite &&
          other.applicationStatus == this.applicationStatus &&
          other.relevanceScore == this.relevanceScore &&
          other.matchedRequiredJson == this.matchedRequiredJson &&
          other.matchedOptionalJson == this.matchedOptionalJson &&
          other.sourceReferencesJson == this.sourceReferencesJson &&
          other.eligibleCountriesJson == this.eligibleCountriesJson &&
          other.timeZoneRequirement == this.timeZoneRequirement);
}

class JobRecordsCompanion extends UpdateCompanion<JobRecord> {
  final Value<String> id;
  final Value<String> sourceId;
  final Value<String> sourceName;
  final Value<String?> sourceJobId;
  final Value<String> title;
  final Value<String> company;
  final Value<String> description;
  final Value<String> location;
  final Value<String?> country;
  final Value<String> workArrangement;
  final Value<String?> employmentType;
  final Value<double?> salaryMin;
  final Value<double?> salaryMax;
  final Value<String?> salaryCurrency;
  final Value<String?> experienceLevel;
  final Value<String> requiredSkillsJson;
  final Value<DateTime?> publishedAt;
  final Value<DateTime> discoveredAt;
  final Value<String?> applicationUrl;
  final Value<String?> companyCareerUrl;
  final Value<String> originalSourceUrl;
  final Value<bool> isFavorite;
  final Value<String> applicationStatus;
  final Value<int> relevanceScore;
  final Value<String> matchedRequiredJson;
  final Value<String> matchedOptionalJson;
  final Value<String> sourceReferencesJson;
  final Value<String> eligibleCountriesJson;
  final Value<String?> timeZoneRequirement;
  final Value<int> rowid;
  const JobRecordsCompanion({
    this.id = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.sourceJobId = const Value.absent(),
    this.title = const Value.absent(),
    this.company = const Value.absent(),
    this.description = const Value.absent(),
    this.location = const Value.absent(),
    this.country = const Value.absent(),
    this.workArrangement = const Value.absent(),
    this.employmentType = const Value.absent(),
    this.salaryMin = const Value.absent(),
    this.salaryMax = const Value.absent(),
    this.salaryCurrency = const Value.absent(),
    this.experienceLevel = const Value.absent(),
    this.requiredSkillsJson = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.discoveredAt = const Value.absent(),
    this.applicationUrl = const Value.absent(),
    this.companyCareerUrl = const Value.absent(),
    this.originalSourceUrl = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.applicationStatus = const Value.absent(),
    this.relevanceScore = const Value.absent(),
    this.matchedRequiredJson = const Value.absent(),
    this.matchedOptionalJson = const Value.absent(),
    this.sourceReferencesJson = const Value.absent(),
    this.eligibleCountriesJson = const Value.absent(),
    this.timeZoneRequirement = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JobRecordsCompanion.insert({
    required String id,
    required String sourceId,
    required String sourceName,
    this.sourceJobId = const Value.absent(),
    required String title,
    required String company,
    required String description,
    required String location,
    this.country = const Value.absent(),
    required String workArrangement,
    this.employmentType = const Value.absent(),
    this.salaryMin = const Value.absent(),
    this.salaryMax = const Value.absent(),
    this.salaryCurrency = const Value.absent(),
    this.experienceLevel = const Value.absent(),
    required String requiredSkillsJson,
    this.publishedAt = const Value.absent(),
    required DateTime discoveredAt,
    this.applicationUrl = const Value.absent(),
    this.companyCareerUrl = const Value.absent(),
    required String originalSourceUrl,
    this.isFavorite = const Value.absent(),
    required String applicationStatus,
    this.relevanceScore = const Value.absent(),
    required String matchedRequiredJson,
    required String matchedOptionalJson,
    required String sourceReferencesJson,
    required String eligibleCountriesJson,
    this.timeZoneRequirement = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sourceId = Value(sourceId),
       sourceName = Value(sourceName),
       title = Value(title),
       company = Value(company),
       description = Value(description),
       location = Value(location),
       workArrangement = Value(workArrangement),
       requiredSkillsJson = Value(requiredSkillsJson),
       discoveredAt = Value(discoveredAt),
       originalSourceUrl = Value(originalSourceUrl),
       applicationStatus = Value(applicationStatus),
       matchedRequiredJson = Value(matchedRequiredJson),
       matchedOptionalJson = Value(matchedOptionalJson),
       sourceReferencesJson = Value(sourceReferencesJson),
       eligibleCountriesJson = Value(eligibleCountriesJson);
  static Insertable<JobRecord> custom({
    Expression<String>? id,
    Expression<String>? sourceId,
    Expression<String>? sourceName,
    Expression<String>? sourceJobId,
    Expression<String>? title,
    Expression<String>? company,
    Expression<String>? description,
    Expression<String>? location,
    Expression<String>? country,
    Expression<String>? workArrangement,
    Expression<String>? employmentType,
    Expression<double>? salaryMin,
    Expression<double>? salaryMax,
    Expression<String>? salaryCurrency,
    Expression<String>? experienceLevel,
    Expression<String>? requiredSkillsJson,
    Expression<DateTime>? publishedAt,
    Expression<DateTime>? discoveredAt,
    Expression<String>? applicationUrl,
    Expression<String>? companyCareerUrl,
    Expression<String>? originalSourceUrl,
    Expression<bool>? isFavorite,
    Expression<String>? applicationStatus,
    Expression<int>? relevanceScore,
    Expression<String>? matchedRequiredJson,
    Expression<String>? matchedOptionalJson,
    Expression<String>? sourceReferencesJson,
    Expression<String>? eligibleCountriesJson,
    Expression<String>? timeZoneRequirement,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceId != null) 'source_id': sourceId,
      if (sourceName != null) 'source_name': sourceName,
      if (sourceJobId != null) 'source_job_id': sourceJobId,
      if (title != null) 'title': title,
      if (company != null) 'company': company,
      if (description != null) 'description': description,
      if (location != null) 'location': location,
      if (country != null) 'country': country,
      if (workArrangement != null) 'work_arrangement': workArrangement,
      if (employmentType != null) 'employment_type': employmentType,
      if (salaryMin != null) 'salary_min': salaryMin,
      if (salaryMax != null) 'salary_max': salaryMax,
      if (salaryCurrency != null) 'salary_currency': salaryCurrency,
      if (experienceLevel != null) 'experience_level': experienceLevel,
      if (requiredSkillsJson != null)
        'required_skills_json': requiredSkillsJson,
      if (publishedAt != null) 'published_at': publishedAt,
      if (discoveredAt != null) 'discovered_at': discoveredAt,
      if (applicationUrl != null) 'application_url': applicationUrl,
      if (companyCareerUrl != null) 'company_career_url': companyCareerUrl,
      if (originalSourceUrl != null) 'original_source_url': originalSourceUrl,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (applicationStatus != null) 'application_status': applicationStatus,
      if (relevanceScore != null) 'relevance_score': relevanceScore,
      if (matchedRequiredJson != null)
        'matched_required_json': matchedRequiredJson,
      if (matchedOptionalJson != null)
        'matched_optional_json': matchedOptionalJson,
      if (sourceReferencesJson != null)
        'source_references_json': sourceReferencesJson,
      if (eligibleCountriesJson != null)
        'eligible_countries_json': eligibleCountriesJson,
      if (timeZoneRequirement != null)
        'time_zone_requirement': timeZoneRequirement,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JobRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? sourceId,
    Value<String>? sourceName,
    Value<String?>? sourceJobId,
    Value<String>? title,
    Value<String>? company,
    Value<String>? description,
    Value<String>? location,
    Value<String?>? country,
    Value<String>? workArrangement,
    Value<String?>? employmentType,
    Value<double?>? salaryMin,
    Value<double?>? salaryMax,
    Value<String?>? salaryCurrency,
    Value<String?>? experienceLevel,
    Value<String>? requiredSkillsJson,
    Value<DateTime?>? publishedAt,
    Value<DateTime>? discoveredAt,
    Value<String?>? applicationUrl,
    Value<String?>? companyCareerUrl,
    Value<String>? originalSourceUrl,
    Value<bool>? isFavorite,
    Value<String>? applicationStatus,
    Value<int>? relevanceScore,
    Value<String>? matchedRequiredJson,
    Value<String>? matchedOptionalJson,
    Value<String>? sourceReferencesJson,
    Value<String>? eligibleCountriesJson,
    Value<String?>? timeZoneRequirement,
    Value<int>? rowid,
  }) {
    return JobRecordsCompanion(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      sourceName: sourceName ?? this.sourceName,
      sourceJobId: sourceJobId ?? this.sourceJobId,
      title: title ?? this.title,
      company: company ?? this.company,
      description: description ?? this.description,
      location: location ?? this.location,
      country: country ?? this.country,
      workArrangement: workArrangement ?? this.workArrangement,
      employmentType: employmentType ?? this.employmentType,
      salaryMin: salaryMin ?? this.salaryMin,
      salaryMax: salaryMax ?? this.salaryMax,
      salaryCurrency: salaryCurrency ?? this.salaryCurrency,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      requiredSkillsJson: requiredSkillsJson ?? this.requiredSkillsJson,
      publishedAt: publishedAt ?? this.publishedAt,
      discoveredAt: discoveredAt ?? this.discoveredAt,
      applicationUrl: applicationUrl ?? this.applicationUrl,
      companyCareerUrl: companyCareerUrl ?? this.companyCareerUrl,
      originalSourceUrl: originalSourceUrl ?? this.originalSourceUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      applicationStatus: applicationStatus ?? this.applicationStatus,
      relevanceScore: relevanceScore ?? this.relevanceScore,
      matchedRequiredJson: matchedRequiredJson ?? this.matchedRequiredJson,
      matchedOptionalJson: matchedOptionalJson ?? this.matchedOptionalJson,
      sourceReferencesJson: sourceReferencesJson ?? this.sourceReferencesJson,
      eligibleCountriesJson:
          eligibleCountriesJson ?? this.eligibleCountriesJson,
      timeZoneRequirement: timeZoneRequirement ?? this.timeZoneRequirement,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (sourceJobId.present) {
      map['source_job_id'] = Variable<String>(sourceJobId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (workArrangement.present) {
      map['work_arrangement'] = Variable<String>(workArrangement.value);
    }
    if (employmentType.present) {
      map['employment_type'] = Variable<String>(employmentType.value);
    }
    if (salaryMin.present) {
      map['salary_min'] = Variable<double>(salaryMin.value);
    }
    if (salaryMax.present) {
      map['salary_max'] = Variable<double>(salaryMax.value);
    }
    if (salaryCurrency.present) {
      map['salary_currency'] = Variable<String>(salaryCurrency.value);
    }
    if (experienceLevel.present) {
      map['experience_level'] = Variable<String>(experienceLevel.value);
    }
    if (requiredSkillsJson.present) {
      map['required_skills_json'] = Variable<String>(requiredSkillsJson.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (discoveredAt.present) {
      map['discovered_at'] = Variable<DateTime>(discoveredAt.value);
    }
    if (applicationUrl.present) {
      map['application_url'] = Variable<String>(applicationUrl.value);
    }
    if (companyCareerUrl.present) {
      map['company_career_url'] = Variable<String>(companyCareerUrl.value);
    }
    if (originalSourceUrl.present) {
      map['original_source_url'] = Variable<String>(originalSourceUrl.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (applicationStatus.present) {
      map['application_status'] = Variable<String>(applicationStatus.value);
    }
    if (relevanceScore.present) {
      map['relevance_score'] = Variable<int>(relevanceScore.value);
    }
    if (matchedRequiredJson.present) {
      map['matched_required_json'] = Variable<String>(
        matchedRequiredJson.value,
      );
    }
    if (matchedOptionalJson.present) {
      map['matched_optional_json'] = Variable<String>(
        matchedOptionalJson.value,
      );
    }
    if (sourceReferencesJson.present) {
      map['source_references_json'] = Variable<String>(
        sourceReferencesJson.value,
      );
    }
    if (eligibleCountriesJson.present) {
      map['eligible_countries_json'] = Variable<String>(
        eligibleCountriesJson.value,
      );
    }
    if (timeZoneRequirement.present) {
      map['time_zone_requirement'] = Variable<String>(
        timeZoneRequirement.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobRecordsCompanion(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('sourceJobId: $sourceJobId, ')
          ..write('title: $title, ')
          ..write('company: $company, ')
          ..write('description: $description, ')
          ..write('location: $location, ')
          ..write('country: $country, ')
          ..write('workArrangement: $workArrangement, ')
          ..write('employmentType: $employmentType, ')
          ..write('salaryMin: $salaryMin, ')
          ..write('salaryMax: $salaryMax, ')
          ..write('salaryCurrency: $salaryCurrency, ')
          ..write('experienceLevel: $experienceLevel, ')
          ..write('requiredSkillsJson: $requiredSkillsJson, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('discoveredAt: $discoveredAt, ')
          ..write('applicationUrl: $applicationUrl, ')
          ..write('companyCareerUrl: $companyCareerUrl, ')
          ..write('originalSourceUrl: $originalSourceUrl, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('applicationStatus: $applicationStatus, ')
          ..write('relevanceScore: $relevanceScore, ')
          ..write('matchedRequiredJson: $matchedRequiredJson, ')
          ..write('matchedOptionalJson: $matchedOptionalJson, ')
          ..write('sourceReferencesJson: $sourceReferencesJson, ')
          ..write('eligibleCountriesJson: $eligibleCountriesJson, ')
          ..write('timeZoneRequirement: $timeZoneRequirement, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KeywordProfilesTable extends KeywordProfiles
    with TableInfo<$KeywordProfilesTable, KeywordProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeywordProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _configurationJsonMeta = const VerificationMeta(
    'configurationJson',
  );
  @override
  late final GeneratedColumn<String> configurationJson =
      GeneratedColumn<String>(
        'configuration_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, configurationJson, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'keyword_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<KeywordProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('configuration_json')) {
      context.handle(
        _configurationJsonMeta,
        configurationJson.isAcceptableOrUnknown(
          data['configuration_json']!,
          _configurationJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_configurationJsonMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KeywordProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KeywordProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      configurationJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}configuration_json'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $KeywordProfilesTable createAlias(String alias) {
    return $KeywordProfilesTable(attachedDatabase, alias);
  }
}

class KeywordProfile extends DataClass implements Insertable<KeywordProfile> {
  final String id;
  final String name;
  final String configurationJson;
  final bool isActive;
  const KeywordProfile({
    required this.id,
    required this.name,
    required this.configurationJson,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['configuration_json'] = Variable<String>(configurationJson);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  KeywordProfilesCompanion toCompanion(bool nullToAbsent) {
    return KeywordProfilesCompanion(
      id: Value(id),
      name: Value(name),
      configurationJson: Value(configurationJson),
      isActive: Value(isActive),
    );
  }

  factory KeywordProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KeywordProfile(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      configurationJson: serializer.fromJson<String>(json['configurationJson']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'configurationJson': serializer.toJson<String>(configurationJson),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  KeywordProfile copyWith({
    String? id,
    String? name,
    String? configurationJson,
    bool? isActive,
  }) => KeywordProfile(
    id: id ?? this.id,
    name: name ?? this.name,
    configurationJson: configurationJson ?? this.configurationJson,
    isActive: isActive ?? this.isActive,
  );
  KeywordProfile copyWithCompanion(KeywordProfilesCompanion data) {
    return KeywordProfile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      configurationJson: data.configurationJson.present
          ? data.configurationJson.value
          : this.configurationJson,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KeywordProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('configurationJson: $configurationJson, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, configurationJson, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KeywordProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.configurationJson == this.configurationJson &&
          other.isActive == this.isActive);
}

class KeywordProfilesCompanion extends UpdateCompanion<KeywordProfile> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> configurationJson;
  final Value<bool> isActive;
  final Value<int> rowid;
  const KeywordProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.configurationJson = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KeywordProfilesCompanion.insert({
    required String id,
    required String name,
    required String configurationJson,
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       configurationJson = Value(configurationJson);
  static Insertable<KeywordProfile> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? configurationJson,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (configurationJson != null) 'configuration_json': configurationJson,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KeywordProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? configurationJson,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return KeywordProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      configurationJson: configurationJson ?? this.configurationJson,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (configurationJson.present) {
      map['configuration_json'] = Variable<String>(configurationJson.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeywordProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('configurationJson: $configurationJson, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SourceSettingsTable extends SourceSettings
    with TableInfo<$SourceSettingsTable, SourceSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _configurationJsonMeta = const VerificationMeta(
    'configurationJson',
  );
  @override
  late final GeneratedColumn<String> configurationJson =
      GeneratedColumn<String>(
        'configuration_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _lastSynchronizedAtMeta =
      const VerificationMeta('lastSynchronizedAt');
  @override
  late final GeneratedColumn<DateTime> lastSynchronizedAt =
      GeneratedColumn<DateTime>(
        'last_synchronized_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastStatusMeta = const VerificationMeta(
    'lastStatus',
  );
  @override
  late final GeneratedColumn<String> lastStatus = GeneratedColumn<String>(
    'last_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    isEnabled,
    configurationJson,
    lastSynchronizedAt,
    lastStatus,
    lastError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'source_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SourceSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('configuration_json')) {
      context.handle(
        _configurationJsonMeta,
        configurationJson.isAcceptableOrUnknown(
          data['configuration_json']!,
          _configurationJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_configurationJsonMeta);
    }
    if (data.containsKey('last_synchronized_at')) {
      context.handle(
        _lastSynchronizedAtMeta,
        lastSynchronizedAt.isAcceptableOrUnknown(
          data['last_synchronized_at']!,
          _lastSynchronizedAtMeta,
        ),
      );
    }
    if (data.containsKey('last_status')) {
      context.handle(
        _lastStatusMeta,
        lastStatus.isAcceptableOrUnknown(data['last_status']!, _lastStatusMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SourceSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourceSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      configurationJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}configuration_json'],
      )!,
      lastSynchronizedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synchronized_at'],
      ),
      lastStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_status'],
      ),
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
    );
  }

  @override
  $SourceSettingsTable createAlias(String alias) {
    return $SourceSettingsTable(attachedDatabase, alias);
  }
}

class SourceSetting extends DataClass implements Insertable<SourceSetting> {
  final String id;
  final bool isEnabled;
  final String configurationJson;
  final DateTime? lastSynchronizedAt;
  final String? lastStatus;
  final String? lastError;
  const SourceSetting({
    required this.id,
    required this.isEnabled,
    required this.configurationJson,
    this.lastSynchronizedAt,
    this.lastStatus,
    this.lastError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['configuration_json'] = Variable<String>(configurationJson);
    if (!nullToAbsent || lastSynchronizedAt != null) {
      map['last_synchronized_at'] = Variable<DateTime>(lastSynchronizedAt);
    }
    if (!nullToAbsent || lastStatus != null) {
      map['last_status'] = Variable<String>(lastStatus);
    }
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  SourceSettingsCompanion toCompanion(bool nullToAbsent) {
    return SourceSettingsCompanion(
      id: Value(id),
      isEnabled: Value(isEnabled),
      configurationJson: Value(configurationJson),
      lastSynchronizedAt: lastSynchronizedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSynchronizedAt),
      lastStatus: lastStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(lastStatus),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory SourceSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourceSetting(
      id: serializer.fromJson<String>(json['id']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      configurationJson: serializer.fromJson<String>(json['configurationJson']),
      lastSynchronizedAt: serializer.fromJson<DateTime?>(
        json['lastSynchronizedAt'],
      ),
      lastStatus: serializer.fromJson<String?>(json['lastStatus']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'configurationJson': serializer.toJson<String>(configurationJson),
      'lastSynchronizedAt': serializer.toJson<DateTime?>(lastSynchronizedAt),
      'lastStatus': serializer.toJson<String?>(lastStatus),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  SourceSetting copyWith({
    String? id,
    bool? isEnabled,
    String? configurationJson,
    Value<DateTime?> lastSynchronizedAt = const Value.absent(),
    Value<String?> lastStatus = const Value.absent(),
    Value<String?> lastError = const Value.absent(),
  }) => SourceSetting(
    id: id ?? this.id,
    isEnabled: isEnabled ?? this.isEnabled,
    configurationJson: configurationJson ?? this.configurationJson,
    lastSynchronizedAt: lastSynchronizedAt.present
        ? lastSynchronizedAt.value
        : this.lastSynchronizedAt,
    lastStatus: lastStatus.present ? lastStatus.value : this.lastStatus,
    lastError: lastError.present ? lastError.value : this.lastError,
  );
  SourceSetting copyWithCompanion(SourceSettingsCompanion data) {
    return SourceSetting(
      id: data.id.present ? data.id.value : this.id,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      configurationJson: data.configurationJson.present
          ? data.configurationJson.value
          : this.configurationJson,
      lastSynchronizedAt: data.lastSynchronizedAt.present
          ? data.lastSynchronizedAt.value
          : this.lastSynchronizedAt,
      lastStatus: data.lastStatus.present
          ? data.lastStatus.value
          : this.lastStatus,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SourceSetting(')
          ..write('id: $id, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('configurationJson: $configurationJson, ')
          ..write('lastSynchronizedAt: $lastSynchronizedAt, ')
          ..write('lastStatus: $lastStatus, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    isEnabled,
    configurationJson,
    lastSynchronizedAt,
    lastStatus,
    lastError,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceSetting &&
          other.id == this.id &&
          other.isEnabled == this.isEnabled &&
          other.configurationJson == this.configurationJson &&
          other.lastSynchronizedAt == this.lastSynchronizedAt &&
          other.lastStatus == this.lastStatus &&
          other.lastError == this.lastError);
}

class SourceSettingsCompanion extends UpdateCompanion<SourceSetting> {
  final Value<String> id;
  final Value<bool> isEnabled;
  final Value<String> configurationJson;
  final Value<DateTime?> lastSynchronizedAt;
  final Value<String?> lastStatus;
  final Value<String?> lastError;
  final Value<int> rowid;
  const SourceSettingsCompanion({
    this.id = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.configurationJson = const Value.absent(),
    this.lastSynchronizedAt = const Value.absent(),
    this.lastStatus = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourceSettingsCompanion.insert({
    required String id,
    this.isEnabled = const Value.absent(),
    required String configurationJson,
    this.lastSynchronizedAt = const Value.absent(),
    this.lastStatus = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       configurationJson = Value(configurationJson);
  static Insertable<SourceSetting> custom({
    Expression<String>? id,
    Expression<bool>? isEnabled,
    Expression<String>? configurationJson,
    Expression<DateTime>? lastSynchronizedAt,
    Expression<String>? lastStatus,
    Expression<String>? lastError,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (configurationJson != null) 'configuration_json': configurationJson,
      if (lastSynchronizedAt != null)
        'last_synchronized_at': lastSynchronizedAt,
      if (lastStatus != null) 'last_status': lastStatus,
      if (lastError != null) 'last_error': lastError,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourceSettingsCompanion copyWith({
    Value<String>? id,
    Value<bool>? isEnabled,
    Value<String>? configurationJson,
    Value<DateTime?>? lastSynchronizedAt,
    Value<String?>? lastStatus,
    Value<String?>? lastError,
    Value<int>? rowid,
  }) {
    return SourceSettingsCompanion(
      id: id ?? this.id,
      isEnabled: isEnabled ?? this.isEnabled,
      configurationJson: configurationJson ?? this.configurationJson,
      lastSynchronizedAt: lastSynchronizedAt ?? this.lastSynchronizedAt,
      lastStatus: lastStatus ?? this.lastStatus,
      lastError: lastError ?? this.lastError,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (configurationJson.present) {
      map['configuration_json'] = Variable<String>(configurationJson.value);
    }
    if (lastSynchronizedAt.present) {
      map['last_synchronized_at'] = Variable<DateTime>(
        lastSynchronizedAt.value,
      );
    }
    if (lastStatus.present) {
      map['last_status'] = Variable<String>(lastStatus.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourceSettingsCompanion(')
          ..write('id: $id, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('configurationJson: $configurationJson, ')
          ..write('lastSynchronizedAt: $lastSynchronizedAt, ')
          ..write('lastStatus: $lastStatus, ')
          ..write('lastError: $lastError, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LinkInspectionsTable extends LinkInspections
    with TableInfo<$LinkInspectionsTable, LinkInspection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinkInspectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hostnameMeta = const VerificationMeta(
    'hostname',
  );
  @override
  late final GeneratedColumn<String> hostname = GeneratedColumn<String>(
    'hostname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _warningsJsonMeta = const VerificationMeta(
    'warningsJson',
  );
  @override
  late final GeneratedColumn<String> warningsJson = GeneratedColumn<String>(
    'warnings_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _inspectedAtMeta = const VerificationMeta(
    'inspectedAt',
  );
  @override
  late final GeneratedColumn<DateTime> inspectedAt = GeneratedColumn<DateTime>(
    'inspected_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reputationStatusMeta = const VerificationMeta(
    'reputationStatus',
  );
  @override
  late final GeneratedColumn<String> reputationStatus = GeneratedColumn<String>(
    'reputation_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    url,
    hostname,
    status,
    warningsJson,
    inspectedAt,
    reputationStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'link_inspections';
  @override
  VerificationContext validateIntegrity(
    Insertable<LinkInspection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('hostname')) {
      context.handle(
        _hostnameMeta,
        hostname.isAcceptableOrUnknown(data['hostname']!, _hostnameMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('warnings_json')) {
      context.handle(
        _warningsJsonMeta,
        warningsJson.isAcceptableOrUnknown(
          data['warnings_json']!,
          _warningsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warningsJsonMeta);
    }
    if (data.containsKey('inspected_at')) {
      context.handle(
        _inspectedAtMeta,
        inspectedAt.isAcceptableOrUnknown(
          data['inspected_at']!,
          _inspectedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inspectedAtMeta);
    }
    if (data.containsKey('reputation_status')) {
      context.handle(
        _reputationStatusMeta,
        reputationStatus.isAcceptableOrUnknown(
          data['reputation_status']!,
          _reputationStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {url};
  @override
  LinkInspection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LinkInspection(
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      hostname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hostname'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      warningsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warnings_json'],
      )!,
      inspectedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}inspected_at'],
      )!,
      reputationStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reputation_status'],
      ),
    );
  }

  @override
  $LinkInspectionsTable createAlias(String alias) {
    return $LinkInspectionsTable(attachedDatabase, alias);
  }
}

class LinkInspection extends DataClass implements Insertable<LinkInspection> {
  final String url;
  final String? hostname;
  final String status;
  final String warningsJson;
  final DateTime inspectedAt;
  final String? reputationStatus;
  const LinkInspection({
    required this.url,
    this.hostname,
    required this.status,
    required this.warningsJson,
    required this.inspectedAt,
    this.reputationStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || hostname != null) {
      map['hostname'] = Variable<String>(hostname);
    }
    map['status'] = Variable<String>(status);
    map['warnings_json'] = Variable<String>(warningsJson);
    map['inspected_at'] = Variable<DateTime>(inspectedAt);
    if (!nullToAbsent || reputationStatus != null) {
      map['reputation_status'] = Variable<String>(reputationStatus);
    }
    return map;
  }

  LinkInspectionsCompanion toCompanion(bool nullToAbsent) {
    return LinkInspectionsCompanion(
      url: Value(url),
      hostname: hostname == null && nullToAbsent
          ? const Value.absent()
          : Value(hostname),
      status: Value(status),
      warningsJson: Value(warningsJson),
      inspectedAt: Value(inspectedAt),
      reputationStatus: reputationStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(reputationStatus),
    );
  }

  factory LinkInspection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LinkInspection(
      url: serializer.fromJson<String>(json['url']),
      hostname: serializer.fromJson<String?>(json['hostname']),
      status: serializer.fromJson<String>(json['status']),
      warningsJson: serializer.fromJson<String>(json['warningsJson']),
      inspectedAt: serializer.fromJson<DateTime>(json['inspectedAt']),
      reputationStatus: serializer.fromJson<String?>(json['reputationStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'url': serializer.toJson<String>(url),
      'hostname': serializer.toJson<String?>(hostname),
      'status': serializer.toJson<String>(status),
      'warningsJson': serializer.toJson<String>(warningsJson),
      'inspectedAt': serializer.toJson<DateTime>(inspectedAt),
      'reputationStatus': serializer.toJson<String?>(reputationStatus),
    };
  }

  LinkInspection copyWith({
    String? url,
    Value<String?> hostname = const Value.absent(),
    String? status,
    String? warningsJson,
    DateTime? inspectedAt,
    Value<String?> reputationStatus = const Value.absent(),
  }) => LinkInspection(
    url: url ?? this.url,
    hostname: hostname.present ? hostname.value : this.hostname,
    status: status ?? this.status,
    warningsJson: warningsJson ?? this.warningsJson,
    inspectedAt: inspectedAt ?? this.inspectedAt,
    reputationStatus: reputationStatus.present
        ? reputationStatus.value
        : this.reputationStatus,
  );
  LinkInspection copyWithCompanion(LinkInspectionsCompanion data) {
    return LinkInspection(
      url: data.url.present ? data.url.value : this.url,
      hostname: data.hostname.present ? data.hostname.value : this.hostname,
      status: data.status.present ? data.status.value : this.status,
      warningsJson: data.warningsJson.present
          ? data.warningsJson.value
          : this.warningsJson,
      inspectedAt: data.inspectedAt.present
          ? data.inspectedAt.value
          : this.inspectedAt,
      reputationStatus: data.reputationStatus.present
          ? data.reputationStatus.value
          : this.reputationStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LinkInspection(')
          ..write('url: $url, ')
          ..write('hostname: $hostname, ')
          ..write('status: $status, ')
          ..write('warningsJson: $warningsJson, ')
          ..write('inspectedAt: $inspectedAt, ')
          ..write('reputationStatus: $reputationStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    url,
    hostname,
    status,
    warningsJson,
    inspectedAt,
    reputationStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LinkInspection &&
          other.url == this.url &&
          other.hostname == this.hostname &&
          other.status == this.status &&
          other.warningsJson == this.warningsJson &&
          other.inspectedAt == this.inspectedAt &&
          other.reputationStatus == this.reputationStatus);
}

class LinkInspectionsCompanion extends UpdateCompanion<LinkInspection> {
  final Value<String> url;
  final Value<String?> hostname;
  final Value<String> status;
  final Value<String> warningsJson;
  final Value<DateTime> inspectedAt;
  final Value<String?> reputationStatus;
  final Value<int> rowid;
  const LinkInspectionsCompanion({
    this.url = const Value.absent(),
    this.hostname = const Value.absent(),
    this.status = const Value.absent(),
    this.warningsJson = const Value.absent(),
    this.inspectedAt = const Value.absent(),
    this.reputationStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LinkInspectionsCompanion.insert({
    required String url,
    this.hostname = const Value.absent(),
    required String status,
    required String warningsJson,
    required DateTime inspectedAt,
    this.reputationStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : url = Value(url),
       status = Value(status),
       warningsJson = Value(warningsJson),
       inspectedAt = Value(inspectedAt);
  static Insertable<LinkInspection> custom({
    Expression<String>? url,
    Expression<String>? hostname,
    Expression<String>? status,
    Expression<String>? warningsJson,
    Expression<DateTime>? inspectedAt,
    Expression<String>? reputationStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (url != null) 'url': url,
      if (hostname != null) 'hostname': hostname,
      if (status != null) 'status': status,
      if (warningsJson != null) 'warnings_json': warningsJson,
      if (inspectedAt != null) 'inspected_at': inspectedAt,
      if (reputationStatus != null) 'reputation_status': reputationStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LinkInspectionsCompanion copyWith({
    Value<String>? url,
    Value<String?>? hostname,
    Value<String>? status,
    Value<String>? warningsJson,
    Value<DateTime>? inspectedAt,
    Value<String?>? reputationStatus,
    Value<int>? rowid,
  }) {
    return LinkInspectionsCompanion(
      url: url ?? this.url,
      hostname: hostname ?? this.hostname,
      status: status ?? this.status,
      warningsJson: warningsJson ?? this.warningsJson,
      inspectedAt: inspectedAt ?? this.inspectedAt,
      reputationStatus: reputationStatus ?? this.reputationStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (hostname.present) {
      map['hostname'] = Variable<String>(hostname.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (warningsJson.present) {
      map['warnings_json'] = Variable<String>(warningsJson.value);
    }
    if (inspectedAt.present) {
      map['inspected_at'] = Variable<DateTime>(inspectedAt.value);
    }
    if (reputationStatus.present) {
      map['reputation_status'] = Variable<String>(reputationStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinkInspectionsCompanion(')
          ..write('url: $url, ')
          ..write('hostname: $hostname, ')
          ..write('status: $status, ')
          ..write('warningsJson: $warningsJson, ')
          ..write('inspectedAt: $inspectedAt, ')
          ..write('reputationStatus: $reputationStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JobRecordsTable jobRecords = $JobRecordsTable(this);
  late final $KeywordProfilesTable keywordProfiles = $KeywordProfilesTable(
    this,
  );
  late final $SourceSettingsTable sourceSettings = $SourceSettingsTable(this);
  late final $LinkInspectionsTable linkInspections = $LinkInspectionsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    jobRecords,
    keywordProfiles,
    sourceSettings,
    linkInspections,
  ];
}

typedef $$JobRecordsTableCreateCompanionBuilder =
    JobRecordsCompanion Function({
      required String id,
      required String sourceId,
      required String sourceName,
      Value<String?> sourceJobId,
      required String title,
      required String company,
      required String description,
      required String location,
      Value<String?> country,
      required String workArrangement,
      Value<String?> employmentType,
      Value<double?> salaryMin,
      Value<double?> salaryMax,
      Value<String?> salaryCurrency,
      Value<String?> experienceLevel,
      required String requiredSkillsJson,
      Value<DateTime?> publishedAt,
      required DateTime discoveredAt,
      Value<String?> applicationUrl,
      Value<String?> companyCareerUrl,
      required String originalSourceUrl,
      Value<bool> isFavorite,
      required String applicationStatus,
      Value<int> relevanceScore,
      required String matchedRequiredJson,
      required String matchedOptionalJson,
      required String sourceReferencesJson,
      required String eligibleCountriesJson,
      Value<String?> timeZoneRequirement,
      Value<int> rowid,
    });
typedef $$JobRecordsTableUpdateCompanionBuilder =
    JobRecordsCompanion Function({
      Value<String> id,
      Value<String> sourceId,
      Value<String> sourceName,
      Value<String?> sourceJobId,
      Value<String> title,
      Value<String> company,
      Value<String> description,
      Value<String> location,
      Value<String?> country,
      Value<String> workArrangement,
      Value<String?> employmentType,
      Value<double?> salaryMin,
      Value<double?> salaryMax,
      Value<String?> salaryCurrency,
      Value<String?> experienceLevel,
      Value<String> requiredSkillsJson,
      Value<DateTime?> publishedAt,
      Value<DateTime> discoveredAt,
      Value<String?> applicationUrl,
      Value<String?> companyCareerUrl,
      Value<String> originalSourceUrl,
      Value<bool> isFavorite,
      Value<String> applicationStatus,
      Value<int> relevanceScore,
      Value<String> matchedRequiredJson,
      Value<String> matchedOptionalJson,
      Value<String> sourceReferencesJson,
      Value<String> eligibleCountriesJson,
      Value<String?> timeZoneRequirement,
      Value<int> rowid,
    });

class $$JobRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $JobRecordsTable> {
  $$JobRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceJobId => $composableBuilder(
    column: $table.sourceJobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workArrangement => $composableBuilder(
    column: $table.workArrangement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get employmentType => $composableBuilder(
    column: $table.employmentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get salaryMin => $composableBuilder(
    column: $table.salaryMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get salaryMax => $composableBuilder(
    column: $table.salaryMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get salaryCurrency => $composableBuilder(
    column: $table.salaryCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get experienceLevel => $composableBuilder(
    column: $table.experienceLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requiredSkillsJson => $composableBuilder(
    column: $table.requiredSkillsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get discoveredAt => $composableBuilder(
    column: $table.discoveredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get applicationUrl => $composableBuilder(
    column: $table.applicationUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyCareerUrl => $composableBuilder(
    column: $table.companyCareerUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalSourceUrl => $composableBuilder(
    column: $table.originalSourceUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get applicationStatus => $composableBuilder(
    column: $table.applicationStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get relevanceScore => $composableBuilder(
    column: $table.relevanceScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get matchedRequiredJson => $composableBuilder(
    column: $table.matchedRequiredJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get matchedOptionalJson => $composableBuilder(
    column: $table.matchedOptionalJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceReferencesJson => $composableBuilder(
    column: $table.sourceReferencesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eligibleCountriesJson => $composableBuilder(
    column: $table.eligibleCountriesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timeZoneRequirement => $composableBuilder(
    column: $table.timeZoneRequirement,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JobRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $JobRecordsTable> {
  $$JobRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceJobId => $composableBuilder(
    column: $table.sourceJobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workArrangement => $composableBuilder(
    column: $table.workArrangement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get employmentType => $composableBuilder(
    column: $table.employmentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get salaryMin => $composableBuilder(
    column: $table.salaryMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get salaryMax => $composableBuilder(
    column: $table.salaryMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get salaryCurrency => $composableBuilder(
    column: $table.salaryCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get experienceLevel => $composableBuilder(
    column: $table.experienceLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requiredSkillsJson => $composableBuilder(
    column: $table.requiredSkillsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get discoveredAt => $composableBuilder(
    column: $table.discoveredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get applicationUrl => $composableBuilder(
    column: $table.applicationUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyCareerUrl => $composableBuilder(
    column: $table.companyCareerUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalSourceUrl => $composableBuilder(
    column: $table.originalSourceUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get applicationStatus => $composableBuilder(
    column: $table.applicationStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get relevanceScore => $composableBuilder(
    column: $table.relevanceScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get matchedRequiredJson => $composableBuilder(
    column: $table.matchedRequiredJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get matchedOptionalJson => $composableBuilder(
    column: $table.matchedOptionalJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceReferencesJson => $composableBuilder(
    column: $table.sourceReferencesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eligibleCountriesJson => $composableBuilder(
    column: $table.eligibleCountriesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timeZoneRequirement => $composableBuilder(
    column: $table.timeZoneRequirement,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JobRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobRecordsTable> {
  $$JobRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceJobId => $composableBuilder(
    column: $table.sourceJobId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get workArrangement => $composableBuilder(
    column: $table.workArrangement,
    builder: (column) => column,
  );

  GeneratedColumn<String> get employmentType => $composableBuilder(
    column: $table.employmentType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get salaryMin =>
      $composableBuilder(column: $table.salaryMin, builder: (column) => column);

  GeneratedColumn<double> get salaryMax =>
      $composableBuilder(column: $table.salaryMax, builder: (column) => column);

  GeneratedColumn<String> get salaryCurrency => $composableBuilder(
    column: $table.salaryCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<String> get experienceLevel => $composableBuilder(
    column: $table.experienceLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requiredSkillsJson => $composableBuilder(
    column: $table.requiredSkillsJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get discoveredAt => $composableBuilder(
    column: $table.discoveredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get applicationUrl => $composableBuilder(
    column: $table.applicationUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get companyCareerUrl => $composableBuilder(
    column: $table.companyCareerUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get originalSourceUrl => $composableBuilder(
    column: $table.originalSourceUrl,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<String> get applicationStatus => $composableBuilder(
    column: $table.applicationStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get relevanceScore => $composableBuilder(
    column: $table.relevanceScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get matchedRequiredJson => $composableBuilder(
    column: $table.matchedRequiredJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get matchedOptionalJson => $composableBuilder(
    column: $table.matchedOptionalJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceReferencesJson => $composableBuilder(
    column: $table.sourceReferencesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eligibleCountriesJson => $composableBuilder(
    column: $table.eligibleCountriesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timeZoneRequirement => $composableBuilder(
    column: $table.timeZoneRequirement,
    builder: (column) => column,
  );
}

class $$JobRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JobRecordsTable,
          JobRecord,
          $$JobRecordsTableFilterComposer,
          $$JobRecordsTableOrderingComposer,
          $$JobRecordsTableAnnotationComposer,
          $$JobRecordsTableCreateCompanionBuilder,
          $$JobRecordsTableUpdateCompanionBuilder,
          (
            JobRecord,
            BaseReferences<_$AppDatabase, $JobRecordsTable, JobRecord>,
          ),
          JobRecord,
          PrefetchHooks Function()
        > {
  $$JobRecordsTableTableManager(_$AppDatabase db, $JobRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sourceId = const Value.absent(),
                Value<String> sourceName = const Value.absent(),
                Value<String?> sourceJobId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> company = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String> workArrangement = const Value.absent(),
                Value<String?> employmentType = const Value.absent(),
                Value<double?> salaryMin = const Value.absent(),
                Value<double?> salaryMax = const Value.absent(),
                Value<String?> salaryCurrency = const Value.absent(),
                Value<String?> experienceLevel = const Value.absent(),
                Value<String> requiredSkillsJson = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<DateTime> discoveredAt = const Value.absent(),
                Value<String?> applicationUrl = const Value.absent(),
                Value<String?> companyCareerUrl = const Value.absent(),
                Value<String> originalSourceUrl = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<String> applicationStatus = const Value.absent(),
                Value<int> relevanceScore = const Value.absent(),
                Value<String> matchedRequiredJson = const Value.absent(),
                Value<String> matchedOptionalJson = const Value.absent(),
                Value<String> sourceReferencesJson = const Value.absent(),
                Value<String> eligibleCountriesJson = const Value.absent(),
                Value<String?> timeZoneRequirement = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JobRecordsCompanion(
                id: id,
                sourceId: sourceId,
                sourceName: sourceName,
                sourceJobId: sourceJobId,
                title: title,
                company: company,
                description: description,
                location: location,
                country: country,
                workArrangement: workArrangement,
                employmentType: employmentType,
                salaryMin: salaryMin,
                salaryMax: salaryMax,
                salaryCurrency: salaryCurrency,
                experienceLevel: experienceLevel,
                requiredSkillsJson: requiredSkillsJson,
                publishedAt: publishedAt,
                discoveredAt: discoveredAt,
                applicationUrl: applicationUrl,
                companyCareerUrl: companyCareerUrl,
                originalSourceUrl: originalSourceUrl,
                isFavorite: isFavorite,
                applicationStatus: applicationStatus,
                relevanceScore: relevanceScore,
                matchedRequiredJson: matchedRequiredJson,
                matchedOptionalJson: matchedOptionalJson,
                sourceReferencesJson: sourceReferencesJson,
                eligibleCountriesJson: eligibleCountriesJson,
                timeZoneRequirement: timeZoneRequirement,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sourceId,
                required String sourceName,
                Value<String?> sourceJobId = const Value.absent(),
                required String title,
                required String company,
                required String description,
                required String location,
                Value<String?> country = const Value.absent(),
                required String workArrangement,
                Value<String?> employmentType = const Value.absent(),
                Value<double?> salaryMin = const Value.absent(),
                Value<double?> salaryMax = const Value.absent(),
                Value<String?> salaryCurrency = const Value.absent(),
                Value<String?> experienceLevel = const Value.absent(),
                required String requiredSkillsJson,
                Value<DateTime?> publishedAt = const Value.absent(),
                required DateTime discoveredAt,
                Value<String?> applicationUrl = const Value.absent(),
                Value<String?> companyCareerUrl = const Value.absent(),
                required String originalSourceUrl,
                Value<bool> isFavorite = const Value.absent(),
                required String applicationStatus,
                Value<int> relevanceScore = const Value.absent(),
                required String matchedRequiredJson,
                required String matchedOptionalJson,
                required String sourceReferencesJson,
                required String eligibleCountriesJson,
                Value<String?> timeZoneRequirement = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JobRecordsCompanion.insert(
                id: id,
                sourceId: sourceId,
                sourceName: sourceName,
                sourceJobId: sourceJobId,
                title: title,
                company: company,
                description: description,
                location: location,
                country: country,
                workArrangement: workArrangement,
                employmentType: employmentType,
                salaryMin: salaryMin,
                salaryMax: salaryMax,
                salaryCurrency: salaryCurrency,
                experienceLevel: experienceLevel,
                requiredSkillsJson: requiredSkillsJson,
                publishedAt: publishedAt,
                discoveredAt: discoveredAt,
                applicationUrl: applicationUrl,
                companyCareerUrl: companyCareerUrl,
                originalSourceUrl: originalSourceUrl,
                isFavorite: isFavorite,
                applicationStatus: applicationStatus,
                relevanceScore: relevanceScore,
                matchedRequiredJson: matchedRequiredJson,
                matchedOptionalJson: matchedOptionalJson,
                sourceReferencesJson: sourceReferencesJson,
                eligibleCountriesJson: eligibleCountriesJson,
                timeZoneRequirement: timeZoneRequirement,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$JobRecordsTable, JobRecord>(table),
                  BaseReferences<_$AppDatabase, $JobRecordsTable, JobRecord>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JobRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JobRecordsTable,
      JobRecord,
      $$JobRecordsTableFilterComposer,
      $$JobRecordsTableOrderingComposer,
      $$JobRecordsTableAnnotationComposer,
      $$JobRecordsTableCreateCompanionBuilder,
      $$JobRecordsTableUpdateCompanionBuilder,
      (JobRecord, BaseReferences<_$AppDatabase, $JobRecordsTable, JobRecord>),
      JobRecord,
      PrefetchHooks Function()
    >;
typedef $$KeywordProfilesTableCreateCompanionBuilder =
    KeywordProfilesCompanion Function({
      required String id,
      required String name,
      required String configurationJson,
      Value<bool> isActive,
      Value<int> rowid,
    });
typedef $$KeywordProfilesTableUpdateCompanionBuilder =
    KeywordProfilesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> configurationJson,
      Value<bool> isActive,
      Value<int> rowid,
    });

class $$KeywordProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $KeywordProfilesTable> {
  $$KeywordProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get configurationJson => $composableBuilder(
    column: $table.configurationJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KeywordProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $KeywordProfilesTable> {
  $$KeywordProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get configurationJson => $composableBuilder(
    column: $table.configurationJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KeywordProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $KeywordProfilesTable> {
  $$KeywordProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get configurationJson => $composableBuilder(
    column: $table.configurationJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$KeywordProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KeywordProfilesTable,
          KeywordProfile,
          $$KeywordProfilesTableFilterComposer,
          $$KeywordProfilesTableOrderingComposer,
          $$KeywordProfilesTableAnnotationComposer,
          $$KeywordProfilesTableCreateCompanionBuilder,
          $$KeywordProfilesTableUpdateCompanionBuilder,
          (
            KeywordProfile,
            BaseReferences<
              _$AppDatabase,
              $KeywordProfilesTable,
              KeywordProfile
            >,
          ),
          KeywordProfile,
          PrefetchHooks Function()
        > {
  $$KeywordProfilesTableTableManager(
    _$AppDatabase db,
    $KeywordProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KeywordProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KeywordProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KeywordProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> configurationJson = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KeywordProfilesCompanion(
                id: id,
                name: name,
                configurationJson: configurationJson,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String configurationJson,
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KeywordProfilesCompanion.insert(
                id: id,
                name: name,
                configurationJson: configurationJson,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$KeywordProfilesTable, KeywordProfile>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $KeywordProfilesTable,
                    KeywordProfile
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KeywordProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KeywordProfilesTable,
      KeywordProfile,
      $$KeywordProfilesTableFilterComposer,
      $$KeywordProfilesTableOrderingComposer,
      $$KeywordProfilesTableAnnotationComposer,
      $$KeywordProfilesTableCreateCompanionBuilder,
      $$KeywordProfilesTableUpdateCompanionBuilder,
      (
        KeywordProfile,
        BaseReferences<_$AppDatabase, $KeywordProfilesTable, KeywordProfile>,
      ),
      KeywordProfile,
      PrefetchHooks Function()
    >;
typedef $$SourceSettingsTableCreateCompanionBuilder =
    SourceSettingsCompanion Function({
      required String id,
      Value<bool> isEnabled,
      required String configurationJson,
      Value<DateTime?> lastSynchronizedAt,
      Value<String?> lastStatus,
      Value<String?> lastError,
      Value<int> rowid,
    });
typedef $$SourceSettingsTableUpdateCompanionBuilder =
    SourceSettingsCompanion Function({
      Value<String> id,
      Value<bool> isEnabled,
      Value<String> configurationJson,
      Value<DateTime?> lastSynchronizedAt,
      Value<String?> lastStatus,
      Value<String?> lastError,
      Value<int> rowid,
    });

class $$SourceSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SourceSettingsTable> {
  $$SourceSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get configurationJson => $composableBuilder(
    column: $table.configurationJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSynchronizedAt => $composableBuilder(
    column: $table.lastSynchronizedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastStatus => $composableBuilder(
    column: $table.lastStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SourceSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SourceSettingsTable> {
  $$SourceSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get configurationJson => $composableBuilder(
    column: $table.configurationJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSynchronizedAt => $composableBuilder(
    column: $table.lastSynchronizedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastStatus => $composableBuilder(
    column: $table.lastStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SourceSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourceSettingsTable> {
  $$SourceSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<String> get configurationJson => $composableBuilder(
    column: $table.configurationJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSynchronizedAt => $composableBuilder(
    column: $table.lastSynchronizedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastStatus => $composableBuilder(
    column: $table.lastStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$SourceSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourceSettingsTable,
          SourceSetting,
          $$SourceSettingsTableFilterComposer,
          $$SourceSettingsTableOrderingComposer,
          $$SourceSettingsTableAnnotationComposer,
          $$SourceSettingsTableCreateCompanionBuilder,
          $$SourceSettingsTableUpdateCompanionBuilder,
          (
            SourceSetting,
            BaseReferences<_$AppDatabase, $SourceSettingsTable, SourceSetting>,
          ),
          SourceSetting,
          PrefetchHooks Function()
        > {
  $$SourceSettingsTableTableManager(
    _$AppDatabase db,
    $SourceSettingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SourceSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SourceSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SourceSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<String> configurationJson = const Value.absent(),
                Value<DateTime?> lastSynchronizedAt = const Value.absent(),
                Value<String?> lastStatus = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceSettingsCompanion(
                id: id,
                isEnabled: isEnabled,
                configurationJson: configurationJson,
                lastSynchronizedAt: lastSynchronizedAt,
                lastStatus: lastStatus,
                lastError: lastError,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<bool> isEnabled = const Value.absent(),
                required String configurationJson,
                Value<DateTime?> lastSynchronizedAt = const Value.absent(),
                Value<String?> lastStatus = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceSettingsCompanion.insert(
                id: id,
                isEnabled: isEnabled,
                configurationJson: configurationJson,
                lastSynchronizedAt: lastSynchronizedAt,
                lastStatus: lastStatus,
                lastError: lastError,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SourceSettingsTable, SourceSetting>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SourceSettingsTable,
                    SourceSetting
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SourceSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourceSettingsTable,
      SourceSetting,
      $$SourceSettingsTableFilterComposer,
      $$SourceSettingsTableOrderingComposer,
      $$SourceSettingsTableAnnotationComposer,
      $$SourceSettingsTableCreateCompanionBuilder,
      $$SourceSettingsTableUpdateCompanionBuilder,
      (
        SourceSetting,
        BaseReferences<_$AppDatabase, $SourceSettingsTable, SourceSetting>,
      ),
      SourceSetting,
      PrefetchHooks Function()
    >;
typedef $$LinkInspectionsTableCreateCompanionBuilder =
    LinkInspectionsCompanion Function({
      required String url,
      Value<String?> hostname,
      required String status,
      required String warningsJson,
      required DateTime inspectedAt,
      Value<String?> reputationStatus,
      Value<int> rowid,
    });
typedef $$LinkInspectionsTableUpdateCompanionBuilder =
    LinkInspectionsCompanion Function({
      Value<String> url,
      Value<String?> hostname,
      Value<String> status,
      Value<String> warningsJson,
      Value<DateTime> inspectedAt,
      Value<String?> reputationStatus,
      Value<int> rowid,
    });

class $$LinkInspectionsTableFilterComposer
    extends Composer<_$AppDatabase, $LinkInspectionsTable> {
  $$LinkInspectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hostname => $composableBuilder(
    column: $table.hostname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warningsJson => $composableBuilder(
    column: $table.warningsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get inspectedAt => $composableBuilder(
    column: $table.inspectedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reputationStatus => $composableBuilder(
    column: $table.reputationStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LinkInspectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $LinkInspectionsTable> {
  $$LinkInspectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hostname => $composableBuilder(
    column: $table.hostname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warningsJson => $composableBuilder(
    column: $table.warningsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get inspectedAt => $composableBuilder(
    column: $table.inspectedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reputationStatus => $composableBuilder(
    column: $table.reputationStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LinkInspectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LinkInspectionsTable> {
  $$LinkInspectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get hostname =>
      $composableBuilder(column: $table.hostname, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get warningsJson => $composableBuilder(
    column: $table.warningsJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get inspectedAt => $composableBuilder(
    column: $table.inspectedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reputationStatus => $composableBuilder(
    column: $table.reputationStatus,
    builder: (column) => column,
  );
}

class $$LinkInspectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LinkInspectionsTable,
          LinkInspection,
          $$LinkInspectionsTableFilterComposer,
          $$LinkInspectionsTableOrderingComposer,
          $$LinkInspectionsTableAnnotationComposer,
          $$LinkInspectionsTableCreateCompanionBuilder,
          $$LinkInspectionsTableUpdateCompanionBuilder,
          (
            LinkInspection,
            BaseReferences<
              _$AppDatabase,
              $LinkInspectionsTable,
              LinkInspection
            >,
          ),
          LinkInspection,
          PrefetchHooks Function()
        > {
  $$LinkInspectionsTableTableManager(
    _$AppDatabase db,
    $LinkInspectionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinkInspectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinkInspectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinkInspectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> url = const Value.absent(),
                Value<String?> hostname = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> warningsJson = const Value.absent(),
                Value<DateTime> inspectedAt = const Value.absent(),
                Value<String?> reputationStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LinkInspectionsCompanion(
                url: url,
                hostname: hostname,
                status: status,
                warningsJson: warningsJson,
                inspectedAt: inspectedAt,
                reputationStatus: reputationStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String url,
                Value<String?> hostname = const Value.absent(),
                required String status,
                required String warningsJson,
                required DateTime inspectedAt,
                Value<String?> reputationStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LinkInspectionsCompanion.insert(
                url: url,
                hostname: hostname,
                status: status,
                warningsJson: warningsJson,
                inspectedAt: inspectedAt,
                reputationStatus: reputationStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LinkInspectionsTable, LinkInspection>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $LinkInspectionsTable,
                    LinkInspection
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LinkInspectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LinkInspectionsTable,
      LinkInspection,
      $$LinkInspectionsTableFilterComposer,
      $$LinkInspectionsTableOrderingComposer,
      $$LinkInspectionsTableAnnotationComposer,
      $$LinkInspectionsTableCreateCompanionBuilder,
      $$LinkInspectionsTableUpdateCompanionBuilder,
      (
        LinkInspection,
        BaseReferences<_$AppDatabase, $LinkInspectionsTable, LinkInspection>,
      ),
      LinkInspection,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JobRecordsTableTableManager get jobRecords =>
      $$JobRecordsTableTableManager(_db, _db.jobRecords);
  $$KeywordProfilesTableTableManager get keywordProfiles =>
      $$KeywordProfilesTableTableManager(_db, _db.keywordProfiles);
  $$SourceSettingsTableTableManager get sourceSettings =>
      $$SourceSettingsTableTableManager(_db, _db.sourceSettings);
  $$LinkInspectionsTableTableManager get linkInspections =>
      $$LinkInspectionsTableTableManager(_db, _db.linkInspections);
}
