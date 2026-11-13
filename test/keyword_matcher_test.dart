import 'package:flutter_test/flutter_test.dart';
import 'package:job_search/features/keywords/domain/keyword_matcher.dart';

void main() {
  const matcher = KeywordMatcher();

  test('requires every term across title and description', () {
    final result = matcher.match(
      title: 'Flutter Developer',
      description: 'Build apps with Dart. Remote work is available.',
      required: ['Flutter', 'Dart', 'Remote'],
    );
    expect(result.accepted, isTrue);
    expect(result.matchedRequired, ['Flutter', 'Dart', 'Remote']);
  });

  test('rejects a job missing even one enabled required term', () {
    final result = matcher.match(
      title: 'Flutter Developer',
      description: 'Use Dart to build applications.',
      required: ['Flutter', 'Dart', 'Remote'],
    );
    expect(result.accepted, isFalse);
    expect(result.matchedRequired, ['Flutter', 'Dart']);
  });

  test('matches Romanian diacritics when configured', () {
    expect(
      matcher
          .match(
            title: 'Inginer software',
            description: 'Experiență în programare',
            required: ['experienta'],
          )
          .accepted,
      isTrue,
    );
    expect(
      const KeywordMatcher(ignoreRomanianDiacritics: false)
          .match(
            title: 'Inginer software',
            description: 'Experiență în programare',
            required: ['experienta'],
          )
          .accepted,
      isFalse,
    );
  });

  test('uses word boundaries for single word keywords', () {
    expect(
      matcher
          .match(title: 'Cartographer', description: '', required: ['art'])
          .accepted,
      isFalse,
    );
    expect(
      matcher
          .match(title: 'Art director', description: '', required: ['art'])
          .accepted,
      isTrue,
    );
  });

  test('applies ALL and ANY groups, exclusions and optional score', () {
    final result = matcher.match(
      title: 'Analyst',
      description: 'Python and English, remote',
      required: ['Analyst'],
      groups: [
        const KeywordGroup(
          keywords: ['Python', 'English'],
          logic: KeywordGroupLogic.all,
        ),
        const KeywordGroup(
          keywords: ['Java', 'Python'],
          logic: KeywordGroupLogic.any,
        ),
      ],
      optional: ['Python', 'Remote', 'SQL'],
    );
    expect(result.accepted, isTrue);
    expect(result.relevanceScore, 67);
    expect(
      matcher
          .match(
            title: 'Analyst',
            description: 'Python and English, remote contract',
            required: ['Analyst'],
            excluded: ['contract'],
          )
          .accepted,
      isFalse,
    );
  });
}
