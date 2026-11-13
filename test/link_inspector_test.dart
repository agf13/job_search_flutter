import 'package:flutter_test/flutter_test.dart';
import 'package:job_search/features/link_inspection/domain/link_inspector.dart';

void main() {
  test('accepts HTTPS and reports hostname without claiming safety', () {
    final result = LinkInspector.inspect('https://jobs.example.com/role/1');
    expect(result.valid, isTrue);
    expect(result.hostname, 'jobs.example.com');
    expect(result.status, 'Basic checks passed');
  });

  test('warns on HTTP, unusual ports and source mismatch', () {
    final result = LinkInspector.inspect(
      'http://192.0.2.2:8080/role',
      expectedHostname: 'jobs.example.com',
    );
    expect(result.valid, isTrue);
    expect(result.suspicious, isTrue);
    expect(result.warnings.length, greaterThanOrEqualTo(3));
  });

  test('reports expected hostname match independently of HTTPS', () {
    final match = LinkInspector.inspect(
      'https://careers.example.com/role',
      expectedHostname: 'example.com',
    );
    final mismatch = LinkInspector.inspect(
      'https://lookalike.example.net/role',
      expectedHostname: 'example.com',
    );
    expect(match.expectedHostnameMatches, isTrue);
    expect(mismatch.expectedHostnameMatches, isFalse);
    expect(mismatch.suspicious, isTrue);
  });

  test('rejects unsupported schemes and relative URLs', () {
    expect(LinkInspector.inspect('javascript:alert(1)').valid, isFalse);
    expect(LinkInspector.inspect('/jobs/1').valid, isFalse);
  });
}
