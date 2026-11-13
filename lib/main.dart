import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/providers.dart';
import 'features/link_inspection/domain/link_inspector.dart';
import 'features/jobs/domain/job.dart';
import 'features/filters/domain/location_filter.dart';
import 'features/keywords/domain/keyword_matcher.dart';
import 'features/sources/domain/source_sync_service.dart';
import 'features/sources/data/source_catalog.dart';
import 'features/sources/data/keyed_job_sources.dart';

void main() => runApp(const ProviderScope(child: DevJobsApp()));

class DevJobsApp extends StatelessWidget {
  const DevJobsApp({super.key});

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xff182722);
    const green = Color(0xff1a704c);
    return MaterialApp(
      title: 'DevJobs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: green,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xfff5f7f3),
        useMaterial3: true,
        fontFamily: 'Roboto',
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfff5f7f3),
          foregroundColor: ink,
        ),
      ),
      home: const JobsWorkspace(),
    );
  }
}

class JobsWorkspace extends ConsumerStatefulWidget {
  const JobsWorkspace({super.key});

  @override
  ConsumerState<JobsWorkspace> createState() => _JobsWorkspaceState();
}

class _JobsWorkspaceState extends ConsumerState<JobsWorkspace> {
  final _keywords = <String>[];
  final _optionalKeywords = <String>[];
  final _excludedKeywords = <String>[];
  final _input = TextEditingController();
  final _jobs = <Job>[];
  bool _hasSearched = false;
  bool _isSearching = false;
  bool _diacritics = true;
  bool _ignoreCase = true;
  int _selectedNav = 0;
  final _arrangements = <String>{'Remote', 'Hybrid', 'On-site'};
  final _locations = <String>{'Romania'};
  List<SourceSyncOutcome> _outcomes = const [];

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _loadCachedJobs();
  }

  Future<void> _loadPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    if (!context.mounted) return;
    setState(() {
      _keywords
        ..clear()
        ..addAll(preferences.getStringList('requiredKeywords') ?? const []);
      _optionalKeywords
        ..clear()
        ..addAll(preferences.getStringList('optionalKeywords') ?? const []);
      _excludedKeywords
        ..clear()
        ..addAll(preferences.getStringList('excludedKeywords') ?? const []);
      _diacritics = preferences.getBool('ignoreRomanianDiacritics') ?? true;
      _ignoreCase = preferences.getBool('ignoreCase') ?? true;
    });
  }

  Future<void> _loadCachedJobs() async {
    final jobs = await ref.read(jobRepositoryProvider).getJobs();
    if (!mounted) return;
    setState(
      () => _jobs
        ..clear()
        ..addAll(jobs),
    );
  }

  Future<void> _persistKeywords() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('requiredKeywords', _keywords);
  }

  final _sourceRows = const [
    SourceCatalogItem(
      'Adzuna',
      'API key required',
      'Public job search API; user supplies app ID and app key.',
      'https://developer.adzuna.com/overview',
      true,
    ),
    SourceCatalogItem(
      'Jooble',
      'Regional API key',
      'Separate API key for each country domain; request limits apply.',
      'https://jooble.org/api/about',
      true,
    ),
    SourceCatalogItem(
      'EURES',
      'Search link',
      'Official multilingual search interface; public API not verified.',
      'https://eures.europa.eu/',
      false,
    ),
    SourceCatalogItem(
      'Remotive',
      'Public API',
      'Remote jobs, delayed by 24 hours; attribution required.',
      'https://remotive.com/api/remote-jobs',
      true,
    ),
    SourceCatalogItem(
      'Himalayas',
      'Public API',
      'Remote listings; preserve application links and credit Himalayas.',
      'https://himalayas.app/api',
      true,
    ),
    SourceCatalogItem(
      'Arbeitnow',
      'Public API',
      'Public job-board API; terms should be confirmed before reuse.',
      'https://www.arbeitnow.com/api/job-board-api',
      true,
    ),
    SourceCatalogItem(
      'Remote OK',
      'Public feed',
      'JSON/RSS feeds; attribution and original job links required.',
      'https://remoteok.com/faq',
      true,
    ),
    SourceCatalogItem(
      'Greenhouse',
      'Company boards',
      'Public jobs API when a company board token is configured.',
      'https://docs.greenhouse.io/job-board',
      true,
    ),
    SourceCatalogItem(
      'Lever',
      'Company boards',
      'Public postings API when a company site identifier is configured.',
      'https://hire.lever.co/developer/documentation',
      true,
    ),
    SourceCatalogItem(
      'eJobs',
      'Search link',
      'Open the website and search there.',
      'https://www.ejobs.ro/',
      false,
    ),
    SourceCatalogItem(
      'BestJobs',
      'Search link',
      'Open the website and search there.',
      'https://www.bestjobs.eu/',
      false,
    ),
    SourceCatalogItem(
      'Hipo',
      'Search link',
      'Open the website and search there.',
      'https://www.hipo.ro/',
      false,
    ),
    SourceCatalogItem(
      'ANOFM',
      'Search link',
      'Open the website and search there.',
      'https://www.anofm.ro/locuri-de-munca-vacante/',
      false,
    ),
    SourceCatalogItem(
      'Company ATS boards',
      'Company identifiers required',
      'Greenhouse and Lever have public board APIs; no universal index.',
      'https://docs.greenhouse.io/job-board',
      true,
    ),
    SourceCatalogItem(
      'LinkedIn Jobs',
      'Search link',
      'No authorized public search API configured.',
      'https://www.linkedin.com/jobs/',
      false,
    ),
    SourceCatalogItem(
      'Indeed',
      'Search link',
      'No authorized public search API configured.',
      'https://www.indeed.com/',
      false,
    ),
  ];

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  void _addKeyword() {
    final value = _input.text.trim();
    if (value.isNotEmpty &&
        !_keywords.any((item) => item.toLowerCase() == value.toLowerCase())) {
      setState(() => _keywords.add(value));
      _persistKeywords();
    }
    _input.clear();
  }

  void _showLinkInspection(String url, {String? expectedHostname}) {
    final result = LinkInspector.inspect(
      url,
      expectedHostname: expectedHostname,
    );
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Inspect link'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              result.hostname ?? 'Invalid hostname',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            SelectableText(url),
            const SizedBox(height: 12),
            Text(
              'Scheme: ${Uri.tryParse(url)?.scheme.toUpperCase() ?? 'Unknown'}',
            ),
            Text(
              result.expectedHostnameMatches == null
                  ? 'Expected source hostname is not configured.'
                  : result.expectedHostnameMatches!
                  ? 'Hostname matches the expected source.'
                  : 'Hostname does not match the expected source.',
            ),
            const SizedBox(height: 8),
            Text(result.status),
            if (result.warnings.isNotEmpty)
              ...result.warnings.map(
                (warning) => Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text('• $warning'),
                ),
              ),
            const SizedBox(height: 10),
            const Text(
              'Local checks do not guarantee that a website is safe. Redirects and reputation have not been checked.',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          FilledButton.tonal(
            onPressed: !result.valid
                ? null
                : () {
                    Navigator.pop(context);
                    _confirmAndOpen(url, result.hostname ?? '');
                  },
            child: const Text('Open in browser'),
          ),
        ],
      ),
    );
  }

  void _showSyncStatus() {
    _performSearch();
  }

  Future<void> _confirmAndOpen(String url, String hostname) async {
    final approved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Open this job link?'),
        content: Text(
          'Your system browser will open $hostname. Local URL checks cannot guarantee that a website is safe.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Open'),
          ),
        ],
      ),
    );
    if (approved != true) return;
    final uri = Uri.tryParse(url);
    if (uri == null || !{'http', 'https'}.contains(uri.scheme)) return;
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open this link.')),
      );
    }
  }

  Future<void> _performSearch() async {
    if (_keywords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Add at least one required keyword first.'),
        ),
      );
      return;
    }
    setState(() {
      _isSearching = true;
      _hasSearched = true;
    });
    try {
      final sources = List.of(ref.read(jobSourcesProvider));
      const secureStorage = FlutterSecureStorage();
      try {
        final adzunaAppId = await secureStorage.read(key: 'adzuna_app_id');
        final adzunaAppKey = await secureStorage.read(key: 'adzuna_app_key');
        if (adzunaAppId != null &&
            adzunaAppId.isNotEmpty &&
            adzunaAppKey != null &&
            adzunaAppKey.isNotEmpty) {
          final countryCode =
              (await secureStorage.read(key: 'adzuna_country')) ?? 'ro';
          sources.add(
            AdzunaJobSource(
              dio: ref.read(dioProvider),
              appId: adzunaAppId,
              appKey: adzunaAppKey,
              countryCode: countryCode,
            ),
          );
        }
        final joobleKey = await secureStorage.read(key: 'jooble_api_key');
        final joobleCountry =
            (await secureStorage.read(key: 'jooble_country')) ?? 'ro';
        if (joobleKey != null && joobleKey.isNotEmpty) {
          sources.add(
            JoobleJobSource(
              dio: ref.read(dioProvider),
              apiKey: joobleKey,
              countryCode: joobleCountry.toLowerCase(),
            ),
          );
        }
      } on Exception {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Secure credential storage is unavailable; searching public sources only.',
              ),
            ),
          );
        }
      }
      final result =
          await SourceSyncService(
            sources: sources,
            repository: ref.read(jobRepositoryProvider),
            database: ref.read(appDatabaseProvider),
          ).synchronize(
            JobSearchCriteria(
              requiredKeywords: List.of(_keywords),
              optionalKeywords: List.of(_optionalKeywords),
              excludedKeywords: List.of(_excludedKeywords),
              locations: List.of(_locations),
              ignoreRomanianDiacritics: _diacritics,
              ignoreCase: _ignoreCase,
            ),
          );
      if (!mounted) return;
      setState(() {
        _jobs
          ..clear()
          ..addAll(result.jobs);
        _outcomes = result.sources;
        _isSearching = false;
      });
      final failures = result.sources
          .where(
            (source) => !{
              SourceSyncStatus.success,
              SourceSyncStatus.noMatches,
              SourceSyncStatus.deferredRefresh,
            }.contains(source.status),
          )
          .length;
      final message = failures == 0
          ? 'Search complete: ${result.jobs.length} matching jobs.'
          : 'Search complete with $failures source issue(s). See source status below.';
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (error) {
      if (!mounted) return;
      setState(() => _isSearching = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Search failed: $error')));
    }
  }

  Future<void> _toggleFavorite(Job job) async {
    await ref.read(jobRepositoryProvider).setFavorite(job.id, !job.isFavorite);
    if (!mounted) return;
    setState(() {
      final index = _jobs.indexWhere((item) => item.id == job.id);
      if (index >= 0) _jobs[index] = job.copyWith(isFavorite: !job.isFavorite);
    });
  }

  Future<void> _updateApplicationStatus(
    Job job,
    ApplicationStatus status,
  ) async {
    await ref.read(jobRepositoryProvider).setApplicationStatus(job.id, status);
    if (!mounted) return;
    setState(() {
      final index = _jobs.indexWhere((item) => item.id == job.id);
      if (index >= 0) _jobs[index] = job.copyWith(applicationStatus: status);
    });
  }

  void _removeKeyword(String value) {
    setState(() => _keywords.remove(value));
    _persistKeywords();
  }

  List<Job> get _filteredJobs {
    if (_keywords.isEmpty) return const [];
    final matcher = KeywordMatcher(
      ignoreCase: _ignoreCase,
      ignoreRomanianDiacritics: _diacritics,
    );
    return _jobs.where((job) {
      if (!LinkInspector.inspect(job.originalSourceUrl).valid) return false;
      final match = matcher.match(
        title: job.title,
        description: job.description,
        required: _keywords,
        optional: _optionalKeywords,
        excluded: _excludedKeywords,
      );
      if (!match.accepted) return false;
      if (_selectedNav == 1 && !job.isFavorite) return false;
      if (_selectedNav == 2 &&
          job.applicationStatus != ApplicationStatus.applied &&
          job.applicationStatus != ApplicationStatus.interview) {
        return false;
      }
      if (!JobLocationFilter.matches(job, _locations)) return false;
      if (_arrangements.isEmpty || _arrangements.length == 3) return true;
      final expected = switch (job.workArrangement) {
        WorkArrangement.remote => 'Remote',
        WorkArrangement.hybrid => 'Hybrid',
        WorkArrangement.onSite => 'On-site',
        WorkArrangement.unspecified => '',
      };
      return _arrangements.contains(expected);
    }).toList();
  }

  void _selectNavigation(int index) {
    if (index == 3) {
      _showSettings(context);
      return;
    }
    setState(() => _selectedNav = index);
  }

  void _showJobDetails(Job job) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _JobDetailsSheet(
        job: job,
        onInspect: () => _showLinkInspection(
          job.originalSourceUrl,
          expectedHostname: _expectedSourceHost(job.sourceId),
        ),
        onInspectUrl: _showLinkInspection,
        onInspectApplication: () {
          final url = job.applicationUrl;
          if (url != null) _showLinkInspection(url);
        },
        onStatus: (status) => _updateApplicationStatus(job, status),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 950;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (wide)
              _NavigationRail(
                selected: _selectedNav,
                onSelect: _selectNavigation,
              ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    titleSpacing: 28,
                    title: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: const Color(0xffdcefe4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.work_outline_rounded,
                            color: Color(0xff1a704c),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'DevJobs',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const _StatusPill(
                          label: 'LOCAL FIRST',
                          color: Color(0xffdcefe4),
                          foreground: Color(0xff1a704c),
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        tooltip: 'Settings',
                        onPressed: () => _showSettings(context),
                        icon: const Icon(Icons.tune_rounded),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      wide ? 42 : 20,
                      28,
                      wide ? 42 : 20,
                      48,
                    ),
                    sliver: SliverList.list(
                      children: [
                        _Header(onRefresh: _showSyncStatus),
                        const SizedBox(height: 26),
                        _SearchPanel(
                          controller: _input,
                          keywords: _keywords,
                          onAdd: _addKeyword,
                          onRemove: _removeKeyword,
                          onSearch: _performSearch,
                          arrangements: _arrangements,
                          locations: _locations,
                          onArrangement: (value) => setState(() {
                            if (!_arrangements.add(value)) {
                              _arrangements.remove(value);
                            }
                          }),
                          onLocation: (value) => setState(() {
                            if (!_locations.add(value)) {
                              _locations.remove(value);
                            }
                          }),
                        ),
                        const SizedBox(height: 24),
                        _Metrics(jobs: _jobs),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Your matches',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.4,
                                    ),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => _showSources(context),
                              icon: const Icon(
                                Icons.travel_explore_outlined,
                                size: 18,
                              ),
                              label: const Text('Manage sources'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (_isSearching)
                          const Card(
                            child: Padding(
                              padding: EdgeInsets.all(30),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 14),
                                    Text('Searching enabled sources…'),
                                  ],
                                ),
                              ),
                            ),
                          )
                        else if (_hasSearched && _filteredJobs.isEmpty)
                          _EmptyResults(
                            keywords: _keywords,
                            outcomes: _outcomes,
                          )
                        else if (_hasSearched || _filteredJobs.isNotEmpty)
                          ..._filteredJobs.map(
                            (job) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _JobCard(
                                job: job,
                                expectedHostname: _expectedSourceHost(
                                  job.sourceId,
                                ),
                                onFavorite: () => _toggleFavorite(job),
                                onInspect: () => _showLinkInspection(
                                  job.originalSourceUrl,
                                  expectedHostname: _expectedSourceHost(
                                    job.sourceId,
                                  ),
                                ),
                                onInspectSource: () {
                                  final sourceUrl = _sourceWebsite(
                                    job.sourceId,
                                  );
                                  if (sourceUrl != null) {
                                    _showLinkInspection(sourceUrl);
                                  }
                                },
                                onDetails: () => _showJobDetails(job),
                              ),
                            ),
                          )
                        else
                          const _WelcomeCard(),
                        if (_outcomes.isNotEmpty)
                          _SourceOutcomes(outcomes: _outcomes),
                        const SizedBox(height: 30),
                        _SourceSummary(
                          sources: _sourceRows
                              .where((source) => source.automated)
                              .toList(),
                          onInspect: _showLinkInspection,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: wide
          ? null
          : NavigationBar(
              selectedIndex: _selectedNav,
              onDestinationSelected: _selectNavigation,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                NavigationDestination(
                  icon: Icon(Icons.bookmark_border),
                  label: 'Saved',
                ),
                NavigationDestination(
                  icon: Icon(Icons.track_changes),
                  label: 'Applications',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
            ),
    );
  }

  void _showSources(BuildContext context) => showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) =>
        _SourcesSheet(sources: _sourceRows, onInspect: _showLinkInspection),
  );
  Future<void> _showSettings(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    final optionalController = TextEditingController(
      text: _optionalKeywords.join(', '),
    );
    final excludedController = TextEditingController(
      text: _excludedKeywords.join(', '),
    );
    const secureStorage = FlutterSecureStorage();
    var adzunaAppId = '';
    var adzunaAppKey = '';
    var adzunaCountry = 'ro';
    var joobleApiKey = '';
    var joobleCountry = 'ro';
    try {
      adzunaAppId = await secureStorage.read(key: 'adzuna_app_id') ?? '';
      adzunaAppKey = await secureStorage.read(key: 'adzuna_app_key') ?? '';
      adzunaCountry = await secureStorage.read(key: 'adzuna_country') ?? 'ro';
      joobleApiKey = await secureStorage.read(key: 'jooble_api_key') ?? '';
      joobleCountry = await secureStorage.read(key: 'jooble_country') ?? 'ro';
    } on Exception {
      // Keep the credential fields empty if the OS secure store is unavailable.
    }
    final adzunaIdController = TextEditingController(text: adzunaAppId);
    final adzunaKeyController = TextEditingController(text: adzunaAppKey);
    final adzunaCountryController = TextEditingController(text: adzunaCountry);
    final joobleKeyController = TextEditingController(text: joobleApiKey);
    final joobleCountryController = TextEditingController(text: joobleCountry);
    if (!context.mounted) return;
    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Search preferences'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchListTile(
                  value: _ignoreCase,
                  onChanged: (value) {
                    setState(() => _ignoreCase = value);
                    preferences.setBool('ignoreCase', value);
                    setDialogState(() {});
                  },
                  title: const Text('Match case-insensitively'),
                  subtitle: const Text(
                    'Ignore capitalization when comparing job text.',
                  ),
                ),
                SwitchListTile(
                  value: _diacritics,
                  onChanged: (value) {
                    setState(() => _diacritics = value);
                    preferences.setBool('ignoreRomanianDiacritics', value);
                    setDialogState(() {});
                  },
                  title: const Text('Match Romanian diacritics'),
                  subtitle: const Text(
                    'Normalize ă/â, î, ș and ț while matching.',
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.rule_outlined),
                  title: Text('Required keywords use AND'),
                  subtitle: Text(
                    'Every keyword must appear in the title or description.',
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.key_outlined),
                  title: Text('Source API credentials'),
                  subtitle: Text(
                    'Credentials use the operating system secure store where supported. They cannot be fully secret from the owner of this device.',
                  ),
                ),
                TextField(
                  controller: adzunaCountryController,
                  decoration: const InputDecoration(
                    labelText: 'Adzuna country code',
                    helperText:
                        'Two-letter API country code, for example ro or gb.',
                  ),
                ),
                TextField(
                  controller: adzunaIdController,
                  decoration: const InputDecoration(
                    labelText: 'Adzuna app ID',
                    helperText: 'Leave both Adzuna fields empty to disable it.',
                  ),
                ),
                TextField(
                  controller: adzunaKeyController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Adzuna app key',
                  ),
                ),
                TextField(
                  controller: joobleCountryController,
                  decoration: const InputDecoration(
                    labelText: 'Jooble country code',
                    helperText:
                        'Two-letter regional domain code, for example ro.',
                  ),
                ),
                TextField(
                  controller: joobleKeyController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Jooble API key',
                    helperText: 'Use a key issued for this country domain.',
                  ),
                ),
                TextField(
                  controller: optionalController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Optional keywords',
                    helperText: 'Comma separated. These raise relevance only.',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: excludedController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Excluded keywords',
                    helperText:
                        'Any match in title or description excludes a job.',
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.shield_outlined),
                  title: Text('Links are inspected locally'),
                  subtitle: Text(
                    'No redirect or reputation lookup is configured.',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton.icon(
              onPressed: () async {
                final json = await ref.read(jobRepositoryProvider).exportJson();
                await Clipboard.setData(ClipboardData(text: json));
                if (!mounted) return;
                ScaffoldMessenger.of(this.context).showSnackBar(
                  const SnackBar(
                    content: Text('Job backup JSON copied to the clipboard.'),
                  ),
                );
              },
              icon: const Icon(Icons.copy_outlined),
              label: const Text('Copy JSON backup'),
            ),
            TextButton.icon(
              onPressed: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (confirmContext) => AlertDialog(
                    title: const Text('Clear cached listings?'),
                    content: const Text(
                      'Non-favorite cached jobs will be removed. Favorites and settings will remain.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(confirmContext, false),
                        child: const Text('Cancel'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.pop(confirmContext, true),
                        child: const Text('Clear cache'),
                      ),
                    ],
                  ),
                );
                if (confirmed != true) return;
                await ref.read(jobRepositoryProvider).clearCachedJobs();
                if (!mounted) return;
                setState(() => _jobs.removeWhere((job) => !job.isFavorite));
                ScaffoldMessenger.of(this.context).showSnackBar(
                  const SnackBar(
                    content: Text('Cached listings were cleared.'),
                  ),
                );
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text('Clear cache'),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  _optionalKeywords
                    ..clear()
                    ..addAll(_parseTerms(optionalController.text));
                  _excludedKeywords
                    ..clear()
                    ..addAll(_parseTerms(excludedController.text));
                });
                await preferences.setStringList(
                  'optionalKeywords',
                  _optionalKeywords,
                );
                await preferences.setStringList(
                  'excludedKeywords',
                  _excludedKeywords,
                );
                final appId = adzunaIdController.text.trim();
                final appKey = adzunaKeyController.text.trim();
                final adzunaRegion = adzunaCountryController.text
                    .trim()
                    .toLowerCase();
                final joobleKey = joobleKeyController.text.trim();
                final country = joobleCountryController.text
                    .trim()
                    .toLowerCase();
                if (joobleKey.isNotEmpty &&
                    !RegExp(r'^[a-z]{2}$').hasMatch(country)) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Jooble country must be a two-letter code.',
                      ),
                    ),
                  );
                  return;
                }
                if (!RegExp(r'^[a-z]{2}$').hasMatch(adzunaRegion)) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Adzuna country must be a two-letter code.',
                      ),
                    ),
                  );
                  return;
                }
                try {
                  await secureStorage.write(
                    key: 'adzuna_country',
                    value: adzunaRegion,
                  );
                  if (appId.isEmpty || appKey.isEmpty) {
                    await secureStorage.delete(key: 'adzuna_app_id');
                    await secureStorage.delete(key: 'adzuna_app_key');
                  } else {
                    await secureStorage.write(
                      key: 'adzuna_app_id',
                      value: appId,
                    );
                    await secureStorage.write(
                      key: 'adzuna_app_key',
                      value: appKey,
                    );
                  }
                  if (joobleKey.isEmpty) {
                    await secureStorage.delete(key: 'jooble_api_key');
                  } else {
                    await secureStorage.write(
                      key: 'jooble_api_key',
                      value: joobleKey,
                    );
                    await secureStorage.write(
                      key: 'jooble_country',
                      value: country,
                    );
                  }
                } on Exception catch (error) {
                  if (mounted) {
                    ScaffoldMessenger.of(this.context).showSnackBar(
                      SnackBar(
                        content: Text('Could not save API credentials: $error'),
                      ),
                    );
                  }
                  return;
                }
                if (!mounted || !context.mounted) return;
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
    optionalController.dispose();
    excludedController.dispose();
    adzunaIdController.dispose();
    adzunaKeyController.dispose();
    adzunaCountryController.dispose();
    joobleKeyController.dispose();
    joobleCountryController.dispose();
  }

  List<String> _parseTerms(String value) => value
      .split(RegExp(r'[,\n]'))
      .map((term) => term.trim())
      .where((term) => term.isNotEmpty)
      .toSet()
      .toList();
}

class _NavigationRail extends StatelessWidget {
  const _NavigationRail({required this.selected, required this.onSelect});
  final int selected;
  final ValueChanged<int> onSelect;
  @override
  Widget build(BuildContext context) => Container(
    width: 232,
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(right: BorderSide(color: Color(0xffe8ece7))),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'WORKSPACE',
            style: TextStyle(
              color: Color(0xff89948c),
              fontSize: 11,
              letterSpacing: 1.3,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 14),
        ...[
          ('Search jobs', Icons.search_rounded),
          ('Saved jobs', Icons.bookmark_border_rounded),
          ('Applications', Icons.track_changes_rounded),
          ('Preferences', Icons.tune_rounded),
        ].indexed.map((entry) {
          final index = entry.$1;
          final item = entry.$2;
          final active = selected == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: ListTile(
              selected: active,
              selectedTileColor: const Color(0xffeaf4ed),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: Icon(
                item.$2,
                color: active
                    ? const Color(0xff1a704c)
                    : const Color(0xff728078),
              ),
              title: Text(
                item.$1,
                style: TextStyle(
                  fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                  color: const Color(0xff23342b),
                ),
              ),
              onTap: () => onSelect(index),
            ),
          );
        }),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Search and organize jobs from one private workspace.',
            style: TextStyle(height: 1.5, color: Color(0xff7c8980)),
          ),
        ),
        const SizedBox(height: 14),
      ],
    ),
  );
}

class _Header extends StatelessWidget {
  const _Header({required this.onRefresh});
  final VoidCallback onRefresh;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, box) => Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TUESDAY, NOVEMBER 11',
                style: TextStyle(
                  color: Color(0xff748178),
                  fontSize: 11,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Find work that fits you.',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.1,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Search any role, with the keywords and conditions you choose.',
                style: TextStyle(color: Color(0xff6f7d74), fontSize: 15),
              ),
            ],
          ),
        ),
        if (box.maxWidth > 550)
          FilledButton.icon(
            onPressed: onRefresh,
            icon: const Icon(Icons.sync_rounded, size: 18),
            label: const Text('Refresh sources'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xff1a704c),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            ),
          ),
      ],
    ),
  );
}

class _SearchPanel extends StatelessWidget {
  const _SearchPanel({
    required this.controller,
    required this.keywords,
    required this.onAdd,
    required this.onRemove,
    required this.onSearch,
    required this.arrangements,
    required this.locations,
    required this.onArrangement,
    required this.onLocation,
  });
  final TextEditingController controller;
  final List<String> keywords;
  final VoidCallback onAdd, onSearch;
  final ValueChanged<String> onRemove, onArrangement;
  final Set<String> arrangements;
  final Set<String> locations;
  final ValueChanged<String> onLocation;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.manage_search_rounded, color: Color(0xff1a704c)),
              const SizedBox(width: 10),
              Text(
                'Build your search',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const Spacer(),
              const _StatusPill(
                label: 'STRICT MATCH',
                color: Color(0xfffff1d8),
                foreground: Color(0xff8b641a),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'Required keywords',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          const Text(
            'Every enabled term must appear in the job title or description.',
            style: TextStyle(color: Color(0xff758179), fontSize: 13),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onSubmitted: (_) => onAdd(),
                  decoration: InputDecoration(
                    hintText: 'Add any role, skill, language, or condition',
                    prefixIcon: const Icon(Icons.add),
                    filled: true,
                    fillColor: const Color(0xfff7f9f6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xffe7ece7)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xffe7ece7)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 13),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(onPressed: onAdd, child: const Text('Add')),
            ],
          ),
          if (keywords.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: keywords
                    .map(
                      (word) => InputChip(
                        label: Text(word),
                        onDeleted: () => onRemove(word),
                        backgroundColor: const Color(0xffeaf4ed),
                      ),
                    )
                    .toList(),
              ),
            )
          else
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'No required terms yet. Add keywords to narrow your results.',
                style: TextStyle(color: Color(0xff89938d), fontSize: 12),
              ),
            ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ...['Remote', 'Hybrid', 'On-site'].map(
                (value) => FilterChip(
                  avatar: Icon(
                    value == 'Remote'
                        ? Icons.public
                        : value == 'Hybrid'
                        ? Icons.swap_horiz
                        : Icons.location_city_outlined,
                    size: 16,
                  ),
                  label: Text(value),
                  selected: arrangements.contains(value),
                  onSelected: (_) => onArrangement(value),
                ),
              ),
              ...['Romania', 'EU', 'Worldwide'].map(
                (value) => FilterChip(
                  avatar: Icon(
                    value == 'Romania'
                        ? Icons.location_on_outlined
                        : Icons.public,
                    size: 16,
                  ),
                  label: Text(value),
                  selected: locations.contains(value),
                  onSelected: (_) => onLocation(value),
                ),
              ),
              FilledButton(
                onPressed: onSearch,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xff1a704c),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                ),
                child: const Text('Search jobs'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class _Metrics extends StatelessWidget {
  const _Metrics({required this.jobs});
  final List<Job> jobs;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, box) {
      final count = box.maxWidth > 760 ? 4 : 2;
      final week = DateTime.now().subtract(const Duration(days: 7));
      final items = [
        (
          jobs.length.toString(),
          'Matching jobs',
          Icons.work_outline,
          const Color(0xffe7f2ea),
        ),
        (
          jobs
              .where((job) => job.publishedAt?.isAfter(week) ?? false)
              .length
              .toString(),
          'New this week',
          Icons.bolt_outlined,
          const Color(0xfffff3dd),
        ),
        (
          jobs.where((job) => job.isFavorite).length.toString(),
          'Saved jobs',
          Icons.bookmark_border,
          const Color(0xffe9effb),
        ),
        (
          jobs
              .where(
                (job) => job.applicationStatus == ApplicationStatus.applied,
              )
              .length
              .toString(),
          'Applications',
          Icons.track_changes,
          const Color(0xfff4e9f2),
        ),
      ];
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: count,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: box.maxWidth / count < 180 ? 1.7 : 2.05,
        children: items
            .map(
              (item) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: item.$4,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Icon(
                          item.$3,
                          size: 18,
                          color: const Color(0xff35473c),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        item.$1,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        item.$2,
                        style: const TextStyle(
                          color: Color(0xff77837a),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      );
    },
  );
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard();
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 24),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xffe8f2eb),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.travel_explore_rounded,
              color: Color(0xff1a704c),
              size: 28,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your next opportunity starts here',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 7),
          const Text(
            'Add your required keywords, then search connected sources. Results will only appear when every required term matches.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff77837a), height: 1.5),
          ),
          const SizedBox(height: 18),
          const Wrap(
            spacing: 7,
            runSpacing: 7,
            alignment: WrapAlignment.center,
            children: [
              _StatusPill(
                label: 'REMOTE',
                color: Color(0xffe7f2ea),
                foreground: Color(0xff28734e),
              ),
              _StatusPill(
                label: 'HYBRID',
                color: Color(0xffe9effb),
                foreground: Color(0xff4b6092),
              ),
              _StatusPill(
                label: 'ON-SITE',
                color: Color(0xfffff3dd),
                foreground: Color(0xff8b641a),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults({required this.keywords, required this.outcomes});
  final List<String> keywords;
  final List<SourceSyncOutcome> outcomes;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'No matching jobs yet',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          ),
          const SizedBox(height: 6),
          Text(
            keywords.isEmpty
                ? 'Add at least one required keyword. With no terms, the strict filter cannot run.'
                : outcomes.any(
                    (source) =>
                        source.status == SourceSyncStatus.failed ||
                        source.status == SourceSyncStatus.authenticationError ||
                        source.status == SourceSyncStatus.rateLimited ||
                        source.status == SourceSyncStatus.unavailable,
                  )
                ? 'Some sources could not be searched. Review their status below. A failed source is kept separate from a successful search with no matches.'
                : 'No jobs passed all ${keywords.length} required keyword${keywords.length == 1 ? '' : 's'} and your excluded-term rules.',
            style: const TextStyle(color: Color(0xff748178), height: 1.5),
          ),
          if (keywords.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Wrap(
                spacing: 7,
                runSpacing: 7,
                children: keywords
                    .map(
                      (k) => _StatusPill(
                        label: k,
                        color: const Color(0xffeaf4ed),
                        foreground: const Color(0xff1a704c),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    ),
  );
}

class _JobCard extends StatelessWidget {
  const _JobCard({
    required this.job,
    required this.expectedHostname,
    required this.onFavorite,
    required this.onInspect,
    required this.onInspectSource,
    required this.onDetails,
  });
  final Job job;
  final String? expectedHostname;
  final VoidCallback onFavorite;
  final VoidCallback onInspect;
  final VoidCallback onInspectSource;
  final VoidCallback onDetails;

  @override
  Widget build(BuildContext context) {
    final inspection = LinkInspector.inspect(
      job.originalSourceUrl,
      expectedHostname: expectedHostname,
    );
    final arrangement = switch (job.workArrangement) {
      WorkArrangement.remote => 'REMOTE',
      WorkArrangement.hybrid => 'HYBRID',
      WorkArrangement.onSite => 'ON-SITE',
      WorkArrangement.unspecified => 'UNSPECIFIED',
    };
    final salary = job.salaryMin == null && job.salaryMax == null
        ? null
        : '${job.salaryCurrency ?? ''} ${job.salaryMin?.round() ?? '—'}–${job.salaryMax?.round() ?? '—'}'
              .trim();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onDetails,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          job.company.isEmpty
                              ? 'Company not provided'
                              : job.company,
                          style: const TextStyle(
                            color: Color(0xff69786f),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  tooltip: job.isFavorite ? 'Remove favorite' : 'Save job',
                  onPressed: onFavorite,
                  icon: Icon(
                    job.isFavorite ? Icons.bookmark : Icons.bookmark_border,
                    color: const Color(0xff1a704c),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 7,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _StatusPill(
                  label: arrangement,
                  color: const Color(0xffe7f2ea),
                  foreground: const Color(0xff28734e),
                ),
                if (job.location.isNotEmpty)
                  Text(
                    job.location,
                    style: const TextStyle(
                      color: Color(0xff69786f),
                      fontSize: 12,
                    ),
                  ),
                if (salary != null)
                  Text(
                    salary,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                if (job.matchedOptionalKeywords.isNotEmpty)
                  _StatusPill(
                    label: 'Relevance ${job.relevanceScore}%',
                    color: const Color(0xfffff3dd),
                    foreground: const Color(0xff8b641a),
                  ),
                InkWell(
                  onTap: onInspectSource,
                  child: Text(
                    job.sourceName,
                    style: const TextStyle(
                      color: Color(0xff69786f),
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                if (job.publishedAt != null)
                  Text(
                    _formatDate(job.publishedAt!),
                    style: const TextStyle(
                      color: Color(0xff89938d),
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
            if (job.matchedRequiredKeywords.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 5,
                children: job.matchedRequiredKeywords
                    .map(
                      (keyword) => _StatusPill(
                        label: '✓ $keyword',
                        color: const Color(0xffedf5ef),
                        foreground: const Color(0xff347451),
                      ),
                    )
                    .toList(),
              ),
            ],
            const Divider(height: 24),
            Row(
              children: [
                Icon(
                  inspection.https
                      ? Icons.lock_outline
                      : Icons.warning_amber_rounded,
                  size: 16,
                  color: inspection.https
                      ? const Color(0xff718078)
                      : const Color(0xffb46b23),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '${inspection.status} · ${inspection.hostname ?? 'Invalid link'}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: inspection.suspicious
                          ? const Color(0xffa05b1d)
                          : const Color(0xff718078),
                      fontSize: 11,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: onInspect,
                  icon: const Icon(Icons.shield_outlined, size: 17),
                  label: const Text('Inspect link'),
                ),
                TextButton(onPressed: onDetails, child: const Text('Details')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _JobDetailsSheet extends StatelessWidget {
  const _JobDetailsSheet({
    required this.job,
    required this.onInspect,
    required this.onInspectUrl,
    required this.onInspectApplication,
    required this.onStatus,
  });
  final Job job;
  final VoidCallback onInspect;
  final ValueChanged<String> onInspectUrl;
  final VoidCallback onInspectApplication;
  final ValueChanged<ApplicationStatus> onStatus;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: DraggableScrollableSheet(
      expand: false,
      initialChildSize: .8,
      builder: (context, controller) => ListView(
        controller: controller,
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
        children: [
          Text(
            job.title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Text(
            job.company,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff68766e),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatusPill(
                label: job.workArrangement.name,
                color: const Color(0xffe7f2ea),
                foreground: const Color(0xff28734e),
              ),
              if (job.location.isNotEmpty)
                _StatusPill(
                  label: job.location,
                  color: const Color(0xffeff1ed),
                  foreground: const Color(0xff4c5b52),
                ),
              _StatusPill(
                label: job.sourceName,
                color: const Color(0xffe9effb),
                foreground: const Color(0xff4b6092),
              ),
            ],
          ),
          const SizedBox(height: 18),
          DropdownButtonFormField<ApplicationStatus>(
            initialValue: job.applicationStatus,
            decoration: const InputDecoration(
              labelText: 'Application status',
              border: OutlineInputBorder(),
            ),
            items: ApplicationStatus.values
                .map(
                  (status) => DropdownMenuItem(
                    value: status,
                    child: Text(_statusLabel(status)),
                  ),
                )
                .toList(),
            onChanged: (status) {
              if (status != null) onStatus(status);
            },
          ),
          const SizedBox(height: 18),
          if (job.matchedRequiredKeywords.isNotEmpty) ...[
            const Text(
              'Matched required keywords',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: job.matchedRequiredKeywords
                  .map(
                    (term) => _StatusPill(
                      label: term,
                      color: const Color(0xffedf5ef),
                      foreground: const Color(0xff347451),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
          ],
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          SelectableText(
            job.description.isEmpty
                ? 'No description was provided by this source.'
                : job.description,
            style: const TextStyle(height: 1.55, color: Color(0xff46534b)),
          ),
          const SizedBox(height: 18),
          const Text(
            'Original listing URL',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          SelectableText(job.originalSourceUrl),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onInspect,
            icon: const Icon(Icons.shield_outlined),
            label: const Text('Inspect link before opening'),
          ),
          if (job.applicationUrl != null &&
              job.applicationUrl != job.originalSourceUrl) ...[
            const SizedBox(height: 18),
            const Text(
              'Application URL',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            SelectableText(job.applicationUrl!),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: onInspectApplication,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Inspect application link'),
            ),
          ],
          if (job.sourceReferences.length > 1) ...[
            const SizedBox(height: 18),
            const Text(
              'Also listed on',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            ...job.sourceReferences
                .where(
                  (reference) => reference.originalUrl != job.originalSourceUrl,
                )
                .map(
                  (reference) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(reference.sourceName),
                    subtitle: Text(
                      reference.originalUrl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      tooltip: 'Inspect source link',
                      onPressed: () => onInspectUrl(reference.originalUrl),
                      icon: const Icon(Icons.shield_outlined),
                    ),
                  ),
                ),
          ],
        ],
      ),
    ),
  );
}

class _SourceOutcomes extends StatelessWidget {
  const _SourceOutcomes({required this.outcomes});
  final List<SourceSyncOutcome> outcomes;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Last source search',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          ...outcomes.map(
            (source) => ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                _sourceIcon(source.status),
                color: _sourceColor(source.status),
                size: 19,
              ),
              title: Text('${source.sourceName} · ${source.status.name}'),
              subtitle: Text(
                source.message ?? '${source.matchCount} matching listing(s)',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

IconData _sourceIcon(SourceSyncStatus status) => switch (status) {
  SourceSyncStatus.success => Icons.check_circle_outline,
  SourceSyncStatus.noMatches => Icons.search_off,
  SourceSyncStatus.rateLimited => Icons.schedule,
  SourceSyncStatus.deferredRefresh => Icons.schedule,
  SourceSyncStatus.skippedNoKeywords => Icons.info_outline,
  _ => Icons.error_outline,
};

Color _sourceColor(SourceSyncStatus status) => switch (status) {
  SourceSyncStatus.success => const Color(0xff1a704c),
  SourceSyncStatus.noMatches => const Color(0xff78847c),
  SourceSyncStatus.rateLimited => const Color(0xffa06b22),
  SourceSyncStatus.deferredRefresh => const Color(0xffa06b22),
  SourceSyncStatus.skippedNoKeywords => const Color(0xff78847c),
  _ => const Color(0xffae4c3c),
};

String _formatDate(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

String _statusLabel(ApplicationStatus status) => switch (status) {
  ApplicationStatus.newListing => 'New',
  ApplicationStatus.interested => 'Interested',
  ApplicationStatus.applied => 'Applied',
  ApplicationStatus.interview => 'Interview',
  ApplicationStatus.rejected => 'Rejected',
  ApplicationStatus.archived => 'Archived',
};

String? _sourceWebsite(String sourceId) {
  if (sourceId == 'remotive') return 'https://remotive.com/';
  if (sourceId == 'himalayas') return 'https://himalayas.app/';
  if (sourceId.startsWith('adzuna_')) return 'https://www.adzuna.com/';
  if (sourceId.startsWith('jooble_')) {
    final country = sourceId.substring('jooble_'.length);
    return 'https://$country.jooble.org/';
  }
  return null;
}

String? _expectedSourceHost(String sourceId) {
  if (sourceId == 'remotive') return 'remotive.com';
  return null;
}

class _SourceSummary extends StatelessWidget {
  const _SourceSummary({required this.sources, required this.onInspect});
  final List<SourceCatalogItem> sources;
  final ValueChanged<String> onInspect;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.hub_outlined, color: Color(0xff1a704c)),
              const SizedBox(width: 9),
              const Expanded(
                child: Text(
                  'Documented source interfaces',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ),
              Text(
                '${sources.length} reviewed',
                style: const TextStyle(color: Color(0xff78847c), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...sources.map(
            (source) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                backgroundColor: Color(0xffeaf4ed),
                child: Icon(Icons.public, color: Color(0xff1a704c), size: 19),
              ),
              title: Text(
                source.name,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                source.summary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                tooltip: 'Inspect source URL',
                onPressed: () => onInspect(source.url),
                icon: const Icon(Icons.open_in_new, size: 19),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _SourcesSheet extends StatelessWidget {
  const _SourcesSheet({required this.sources, required this.onInspect});
  final List<SourceCatalogItem> sources;
  final ValueChanged<String> onInspect;
  @override
  Widget build(BuildContext context) => SafeArea(
    child: DraggableScrollableSheet(
      expand: false,
      initialChildSize: .85,
      builder: (context, controller) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 10),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Job sources',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(22, 0, 22, 10),
            child: Text(
              'Automatic access is limited to documented public interfaces. Other sites open as manual searches.',
              style: TextStyle(color: Color(0xff748178)),
            ),
          ),
          Expanded(
            child: ListView(
              controller: controller,
              children: sources
                  .map(
                    (source) => ListTile(
                      title: Text(source.name),
                      subtitle: Text('${source.type} · ${source.summary}'),
                      isThreeLine: true,
                      onTap: () => onInspect(source.url),
                      trailing: IconButton(
                        tooltip: 'Inspect link',
                        icon: const Icon(Icons.shield_outlined),
                        onPressed: () => onInspect(source.url),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    ),
  );
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.label,
    required this.color,
    required this.foreground,
  });
  final String label;
  final Color color, foreground;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(99),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: foreground,
        fontSize: 10,
        letterSpacing: .5,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
