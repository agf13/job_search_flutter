# DevJobs — local Flutter job finder

DevJobs is a desktop-first Flutter application for searching jobs with user-defined keywords. It runs requests and matching in the Flutter app and stores listings in a local Drift/SQLite database. There is no separate backend or cloud database.

## Current implementation

- Required keywords are user-defined and use strict AND matching across title and description. Case and Romanian diacritic handling are configurable. Keyword group ALL/ANY logic, excluded terms, and optional relevance terms are implemented in the matching domain layer. Missing one required term excludes a listing before scoring.
- The app stores cached jobs locally, deduplicates by source ID, normalized application URL, then company/title/location, and retains source references. Favorites and application statuses are persisted.
- Results can be filtered by keyword terms, Romania/EU/worldwide location classification, work arrangement, favorites, and application status. A job is shown only with a validated HTTP(S) original URL.
- Link inspection parses URLs locally and warns about HTTP, unusual ports, embedded credentials, IP hosts, internationalized hostnames, and expected-host mismatches. Opening requires an explicit action. Redirect resolution and reputation checks are not configured, so the app does not claim that a link is safe.
- Synchronization runs while the application is open, with source-specific refresh windows, request timeouts/retries, and per-source outcomes. Linux desktop background execution after closing the app is not promised.
- Settings currently include required terms, optional and excluded terms, matching preferences, API credentials, clipboard JSON backup, and removal of non-favorite cached jobs.

## Sources

| Source | Status | Notes |
| --- | --- | --- |
| Remotive | Integrated | Public remote jobs API; listings may be delayed. Attribution and API request limits apply. |
| Himalayas | Integrated | Public jobs API; attribution and application links are retained. |
| Adzuna | Integrated when configured | Requires a user-provided app ID and key; salary fields are used when present. Country availability depends on Adzuna's API. |
| Jooble | Integrated when configured | Requires a user-provided regional API key and country code; country-specific request limits apply. |
| eJobs, BestJobs, Hipo, ANOFM | Manual source links | No automated adapter is enabled. Protected pages are not scraped. |
| EURES | Manual source link | Official search interface only; no supported public API was verified for this app. |
| LinkedIn Jobs, Indeed | Manual source links | No authorized public search integration is configured. |
| Arbeitnow, Remote OK | Not implemented | No adapter is included in the current MVP. |
| Greenhouse, Lever and other ATS platforms | Not implemented | Company-specific board identifiers and verified public interfaces are needed. |

API credentials are entered by the user and stored with Flutter Secure Storage where the platform supports it. Credentials embedded in a distributed client cannot be considered secret from the owner of that device. No API key is included in source code.

## Current limitations

Keyword groups and profiles exist in the matching model but do not yet have a complete management UI or saved-profile workflow. Settings currently store the active required, optional, and excluded terms using Shared Preferences. Custom-country selection, a configurable company registry, complete per-source enable/disable controls, redirect inspection, external reputation checks, automatic background sync, and a file-based export flow remain future work. JSON backup is copied to the clipboard.

Some APIs return snippets rather than full descriptions. Strict matching operates on the text supplied by each source, so a missing description term can exclude a listing even if the full employer page contains it. Work arrangement is only populated where source data provides a clear signal; unspecified listings should not be treated as remote.

## Development

From the project root:

```sh
flutter pub get
dart run build_runner build
dart format lib test
flutter analyze
flutter test
```

Tests use mocked responses and do not require live job sites or real credentials.
