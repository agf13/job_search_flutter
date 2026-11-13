import 'package:flutter_test/flutter_test.dart';
import 'package:job_search/features/filters/domain/location_filter.dart';
import 'package:job_search/features/jobs/domain/job.dart';

Job _job({
  required String location,
  String? country,
  List<String> eligible = const [],
}) => Job(
  id: 'job',
  sourceId: 'source',
  sourceName: 'Source',
  title: 'Opportunity',
  description: '',
  location: location,
  country: country,
  eligibleCountries: eligible,
  originalSourceUrl: 'https://example.com/job',
  discoveredAt: DateTime.utc(2026),
);

void main() {
  test('matches selected country and EU region', () {
    final job = _job(location: 'Remote', eligible: ['Romania', 'Germany']);
    expect(JobLocationFilter.matches(job, ['Romania']), isTrue);
    expect(JobLocationFilter.matches(job, ['EU']), isTrue);
    expect(JobLocationFilter.matches(job, ['France']), isFalse);
  });

  test('only treats an explicit worldwide label as worldwide eligibility', () {
    expect(
      JobLocationFilter.matches(
        _job(location: 'Remote (eligibility unspecified)'),
        ['Worldwide'],
      ),
      isFalse,
    );
    expect(
      JobLocationFilter.matches(
        _job(location: 'Remote', eligible: ['Worldwide']),
        ['Worldwide'],
      ),
      isTrue,
    );
  });

  test('multiple selected locations use OR logic', () {
    expect(
      JobLocationFilter.matches(_job(location: 'Paris, France'), [
        'Romania',
        'France',
      ]),
      isTrue,
    );
  });
}
