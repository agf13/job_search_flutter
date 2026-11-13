import '../../jobs/domain/job.dart';

class JobLocationFilter {
  static const _euCountries = {
    'austria',
    'belgium',
    'bulgaria',
    'croatia',
    'cyprus',
    'czechia',
    'czech republic',
    'denmark',
    'estonia',
    'finland',
    'france',
    'germany',
    'greece',
    'hungary',
    'ireland',
    'italy',
    'latvia',
    'lithuania',
    'luxembourg',
    'malta',
    'netherlands',
    'poland',
    'portugal',
    'romania',
    'slovakia',
    'slovenia',
    'spain',
    'sweden',
  };
  static const _euCodes = {
    'at',
    'be',
    'bg',
    'hr',
    'cy',
    'cz',
    'dk',
    'ee',
    'fi',
    'fr',
    'de',
    'gr',
    'hu',
    'ie',
    'it',
    'lv',
    'lt',
    'lu',
    'mt',
    'nl',
    'pl',
    'pt',
    'ro',
    'sk',
    'si',
    'es',
    'se',
  };

  static bool matches(Job job, Iterable<String> selected) {
    final locations = selected
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList();
    if (locations.isEmpty) return true;
    final details = [
      job.country ?? '',
      job.location,
      ...job.eligibleCountries,
    ].join(' ').toLowerCase();
    return locations.any((location) {
      final normalized = location.toLowerCase();
      if (normalized == 'worldwide') {
        return details.contains('worldwide') || details.contains('global');
      }
      if (normalized == 'romania') {
        return details.contains('romania') || _hasToken(details, 'ro');
      }
      if (normalized == 'eu') {
        return _euCountries.any(details.contains) ||
            _euCodes.any((code) => _hasToken(details, code));
      }
      return details.contains(normalized);
    });
  }

  static bool _hasToken(String value, String token) =>
      RegExp(r'(^|[^a-z])' + token + r'([^a-z]|$)').hasMatch(value);
}
