enum WorkArrangement { remote, hybrid, onSite, unspecified }

enum ApplicationStatus {
  newListing,
  interested,
  applied,
  interview,
  rejected,
  archived,
}

class JobSourceReference {
  const JobSourceReference({
    required this.sourceId,
    required this.sourceName,
    required this.sourceJobId,
    required this.originalUrl,
    this.isEmployerOwned = false,
  });

  final String sourceId;
  final String sourceName;
  final String? sourceJobId;
  final String originalUrl;
  final bool isEmployerOwned;
}

class Job {
  const Job({
    required this.id,
    required this.sourceId,
    required this.sourceName,
    required this.title,
    required this.description,
    required this.originalSourceUrl,
    required this.discoveredAt,
    this.sourceJobId,
    this.company = '',
    this.location = '',
    this.country,
    this.workArrangement = WorkArrangement.unspecified,
    this.employmentType,
    this.salaryMin,
    this.salaryMax,
    this.salaryCurrency,
    this.experienceLevel,
    this.requiredSkills = const [],
    this.publishedAt,
    this.applicationUrl,
    this.companyCareerUrl,
    this.isFavorite = false,
    this.applicationStatus = ApplicationStatus.newListing,
    this.relevanceScore = 0,
    this.matchedRequiredKeywords = const [],
    this.matchedOptionalKeywords = const [],
    this.sourceReferences = const [],
    this.eligibleCountries = const [],
    this.timeZoneRequirement,
  });

  final String id;
  final String sourceId;
  final String sourceName;
  final String? sourceJobId;
  final String title;
  final String company;
  final String description;
  final String location;
  final String? country;
  final WorkArrangement workArrangement;
  final String? employmentType;
  final num? salaryMin;
  final num? salaryMax;
  final String? salaryCurrency;
  final String? experienceLevel;
  final List<String> requiredSkills;
  final DateTime? publishedAt;
  final DateTime discoveredAt;
  final String? applicationUrl;
  final String? companyCareerUrl;
  final String originalSourceUrl;
  final bool isFavorite;
  final ApplicationStatus applicationStatus;
  final int relevanceScore;
  final List<String> matchedRequiredKeywords;
  final List<String> matchedOptionalKeywords;
  final List<JobSourceReference> sourceReferences;
  final List<String> eligibleCountries;
  final String? timeZoneRequirement;

  Job copyWith({
    String? applicationUrl,
    String? companyCareerUrl,
    bool? isFavorite,
    ApplicationStatus? applicationStatus,
    int? relevanceScore,
    List<String>? matchedRequiredKeywords,
    List<String>? matchedOptionalKeywords,
    List<JobSourceReference>? sourceReferences,
  }) => Job(
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
    requiredSkills: requiredSkills,
    publishedAt: publishedAt,
    discoveredAt: discoveredAt,
    applicationUrl: applicationUrl ?? this.applicationUrl,
    companyCareerUrl: companyCareerUrl ?? this.companyCareerUrl,
    originalSourceUrl: originalSourceUrl,
    isFavorite: isFavorite ?? this.isFavorite,
    applicationStatus: applicationStatus ?? this.applicationStatus,
    relevanceScore: relevanceScore ?? this.relevanceScore,
    matchedRequiredKeywords:
        matchedRequiredKeywords ?? this.matchedRequiredKeywords,
    matchedOptionalKeywords:
        matchedOptionalKeywords ?? this.matchedOptionalKeywords,
    sourceReferences: sourceReferences ?? this.sourceReferences,
    eligibleCountries: eligibleCountries,
    timeZoneRequirement: timeZoneRequirement,
  );
}
