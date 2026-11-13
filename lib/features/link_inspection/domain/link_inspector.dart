class LinkInspectionResult {
  const LinkInspectionResult({
    required this.valid,
    required this.hostname,
    required this.https,
    required this.expectedHostnameMatches,
    required this.status,
    required this.warnings,
    required this.suspicious,
  });
  final bool valid;
  final String? hostname;
  final bool https;
  final bool? expectedHostnameMatches;
  final String status;
  final List<String> warnings;
  final bool suspicious;
}

class LinkInspector {
  static LinkInspectionResult inspect(
    String value, {
    String? expectedHostname,
  }) {
    final uri = Uri.tryParse(value.trim());
    if (uri == null ||
        !uri.hasAuthority ||
        uri.host.isEmpty ||
        !{'http', 'https'}.contains(uri.scheme.toLowerCase())) {
      return LinkInspectionResult(
        valid: false,
        hostname: null,
        https: false,
        expectedHostnameMatches: expectedHostname == null ? null : false,
        status: 'Invalid or unsupported URL',
        warnings: ['Only absolute HTTP and HTTPS URLs are supported.'],
        suspicious: true,
      );
    }
    final host = uri.host.toLowerCase();
    final warnings = <String>[];
    final https = uri.scheme.toLowerCase() == 'https';
    if (!https) {
      warnings.add('This link uses an unencrypted HTTP connection.');
    }
    if (uri.userInfo.isNotEmpty) {
      warnings.add(
        'The URL contains embedded username or password information.',
      );
    }
    if (uri.hasPort &&
        !((https && uri.port == 443) || (!https && uri.port == 80))) {
      warnings.add('The URL uses an unusual port (${uri.port}).');
    }
    if (RegExp(r'^\d{1,3}(\.\d{1,3}){3}$').hasMatch(host) ||
        host.contains(':')) {
      warnings.add('The hostname is an IP address rather than a domain name.');
    }
    if (host.contains('xn--')) {
      warnings.add(
        'The hostname contains an internationalized domain name; check for lookalikes.',
      );
    }
    final sourceMatch = expectedHostname == null
        ? null
        : host == expectedHostname.toLowerCase() ||
              host.endsWith('.${expectedHostname.toLowerCase()}');
    if (sourceMatch == false) {
      warnings.add('The hostname does not match the expected source domain.');
    }
    final suspicious = warnings.isNotEmpty;
    final status = !https
        ? 'Warning: HTTP connection'
        : suspicious
        ? 'Warning: suspicious URL'
        : 'Basic checks passed';
    return LinkInspectionResult(
      valid: true,
      hostname: host,
      https: https,
      expectedHostnameMatches: sourceMatch,
      status: status,
      warnings: warnings,
      suspicious: suspicious,
    );
  }
}
