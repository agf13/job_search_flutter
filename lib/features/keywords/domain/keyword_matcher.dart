enum KeywordGroupLogic { all, any }

class KeywordGroup {
  const KeywordGroup({required this.keywords, required this.logic});
  final List<String> keywords;
  final KeywordGroupLogic logic;
}

class JobSearchCriteria {
  const JobSearchCriteria({
    this.requiredKeywords = const [],
    this.groups = const [],
    this.optionalKeywords = const [],
    this.excludedKeywords = const [],
    this.location,
    this.locations = const [],
    this.ignoreCase = true,
    this.ignoreRomanianDiacritics = true,
  });

  final List<String> requiredKeywords;
  final List<KeywordGroup> groups;
  final List<String> optionalKeywords;
  final List<String> excludedKeywords;
  final String? location;
  final List<String> locations;
  final bool ignoreCase;
  final bool ignoreRomanianDiacritics;
}

class KeywordMatchResult {
  const KeywordMatchResult({
    required this.accepted,
    required this.matchedRequired,
    required this.matchedOptional,
    required this.matchedGroups,
    required this.matchedExcluded,
    required this.relevanceScore,
  });
  final bool accepted;
  final List<String> matchedRequired;
  final List<String> matchedOptional;
  final Map<String, List<String>> matchedGroups;
  final List<String> matchedExcluded;
  final int relevanceScore;
}

/// Strict local matcher. Matching is performed against the combined title and
/// description, so a term can appear in either field.
class KeywordMatcher {
  const KeywordMatcher({
    this.ignoreCase = true,
    this.ignoreRomanianDiacritics = true,
  });
  final bool ignoreCase;
  final bool ignoreRomanianDiacritics;

  KeywordMatchResult match({
    required String title,
    required String description,
    List<String> required = const [],
    List<KeywordGroup> groups = const [],
    List<String> optional = const [],
    List<String> excluded = const [],
  }) {
    final text = _normalize('$title $description');
    final matchedRequired = required
        .where((term) => _contains(text, term))
        .toList();
    final matchedExcluded = excluded
        .where((term) => _contains(text, term))
        .toList();
    final matchedOptional = optional
        .where((term) => _contains(text, term))
        .toList();
    final groupMatches = <String, List<String>>{};
    var groupsPass = true;
    for (final group in groups) {
      final matches = group.keywords
          .where((term) => _contains(text, term))
          .toList();
      groupMatches[group.keywords.join(', ')] = matches;
      final passes = group.logic == KeywordGroupLogic.all
          ? matches.length == group.keywords.length
          : matches.isNotEmpty;
      if (!passes) groupsPass = false;
    }
    final accepted =
        matchedRequired.length == required.length &&
        groupsPass &&
        matchedExcluded.isEmpty;
    return KeywordMatchResult(
      accepted: accepted,
      matchedRequired: matchedRequired,
      matchedOptional: matchedOptional,
      matchedGroups: groupMatches,
      matchedExcluded: matchedExcluded,
      relevanceScore: accepted && optional.isNotEmpty
          ? ((matchedOptional.length / optional.length) * 100).round()
          : 0,
    );
  }

  String _normalize(String value) {
    var result = value.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (ignoreCase) result = result.toLowerCase();
    if (ignoreRomanianDiacritics) {
      const replacements = {
        'ă': 'a',
        'â': 'a',
        'î': 'i',
        'ș': 's',
        'ş': 's',
        'ț': 't',
        'ţ': 't',
      };
      replacements.forEach((from, to) => result = result.replaceAll(from, to));
    }
    return result;
  }

  bool _contains(String haystack, String input) {
    final needle = _normalize(input);
    if (needle.isEmpty) return false;
    // Terms containing punctuation or spaces are matched as a phrase. A single
    // alphanumeric term uses boundaries to avoid matches such as "art" in "cart".
    if (RegExp(r'^[\p{L}\p{N}_]+$', unicode: true).hasMatch(needle)) {
      return RegExp(
        '(?<![\\p{L}\\p{N}_])${RegExp.escape(needle)}(?![\\p{L}\\p{N}_])',
        unicode: true,
      ).hasMatch(haystack);
    }
    return haystack.contains(needle);
  }
}
