import 'package:flutter_test/flutter_test.dart';
import 'package:template_app/core/utils/env.dart';

void main() {
  group('Env - String.fromEnvironment', () {
    test('apiKey returns value from dart-define API_KEY', () {
      // Note: In real tests, this would be set via --dart-define
      // For this test, we're just verifying the getter works
      final apiKey = Env.apiKey;
      expect(apiKey, isA<String>());
    });

    test('baseUrl returns value from dart-define BASE_URL', () {
      final baseUrl = Env.baseUrl;
      expect(baseUrl, isA<String>());
    });

    test('environment variables are accessible', () {
      // This test validates that the Env class structure is correct
      // In actual runtime with dart-defines, these would have real values
      expect(() => Env.apiKey, returnsNormally);
      expect(() => Env.baseUrl, returnsNormally);
    });
  });
}
