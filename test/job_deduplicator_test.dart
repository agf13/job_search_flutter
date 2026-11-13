import 'package:flutter_test/flutter_test.dart';
import 'package:job_search/features/jobs/domain/job.dart';
import 'package:job_search/features/jobs/domain/job_deduplicator.dart';

Job job({
  required String id,
  required String source,
  required String title,
  String? sourceJobId,
  String? applicationUrl,
  String originalUrl = 'https://aggregator.example/jobs/1',
  String company = 'Acme',
  String location = 'Bucharest',
  bool employerOwned = false,
}) => Job(
  id: id,
  sourceId: source,
  sourceName: source,
  sourceJobId: sourceJobId,
  title: title,
  company: company,
  description: 'Job description',
  location: location,
  originalSourceUrl: originalUrl,
  applicationUrl: applicationUrl,
  discoveredAt: DateTime.utc(2026),
  sourceReferences: [
    JobSourceReference(
      sourceId: source,
      sourceName: source,
      sourceJobId: sourceJobId,
      originalUrl: originalUrl,
      isEmployerOwned: employerOwned,
    ),
  ],
);

void main() {
  const deduplicator = JobDeduplicator();

  test(
    'deduplicates by normalized application URL and retains all sources',
    () {
      final jobs = deduplicator.deduplicate([
        job(
          id: 'a',
          source: 'board-a',
          title: 'Designer',
          applicationUrl: 'https://company.example/jobs/123#apply',
        ),
        job(
          id: 'b',
          source: 'board-b',
          title: 'Product Designer',
          applicationUrl: 'https://company.example/jobs/123',
          originalUrl: 'https://company.example/jobs/123',
          employerOwned: true,
        ),
      ]);

      expect(jobs, hasLength(1));
      expect(jobs.single.sourceReferences, hasLength(2));
      expect(jobs.single.applicationUrl, 'https://company.example/jobs/123');
    },
  );

  test('falls back to normalized company, title and location', () {
    final jobs = deduplicator.deduplicate([
      job(id: 'a', source: 'a', title: 'Senior  Designer'),
      job(
        id: 'b',
        source: 'b',
        title: 'senior designer',
        originalUrl: 'https://other.example/role',
      ),
    ]);
    expect(jobs, hasLength(1));
  });

  test('source-specific IDs take priority', () {
    final jobs = deduplicator.deduplicate([
      job(id: 'a', source: 'board', title: 'Role A', sourceJobId: '123'),
      job(
        id: 'b',
        source: 'board',
        title: 'Different title',
        sourceJobId: '123',
        originalUrl: 'https://other.example/role',
      ),
    ]);
    expect(jobs, hasLength(1));
    expect(jobs.single.sourceReferences, hasLength(2));
  });
}
