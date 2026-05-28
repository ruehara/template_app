import 'package:flutter_test/flutter_test.dart';
import 'package:template_app/core/utils/exceptions.dart';

void main() {
  group('AppException hierarchy', () {
    test('AuthException stores message and toString returns it', () {
      const e = AuthException('Invalid credentials');
      expect(e.message, 'Invalid credentials');
      expect(e.toString(), 'Invalid credentials');
      expect(e, isA<AppException>());
      expect(e, isA<Exception>());
    });

    test('DatabaseException stores message and toString returns it', () {
      const e = DatabaseException('DB error');
      expect(e.message, 'DB error');
      expect(e.toString(), 'DB error');
      expect(e, isA<AppException>());
    });

    test('NetworkException stores message and toString returns it', () {
      const e = NetworkException('Network error');
      expect(e.message, 'Network error');
      expect(e.toString(), 'Network error');
      expect(e, isA<AppException>());
    });

    test('exception types are distinct', () {
      const auth = AuthException('a');
      const db = DatabaseException('b');
      const net = NetworkException('c');
      expect(auth, isNot(isA<DatabaseException>()));
      expect(db, isNot(isA<NetworkException>()));
      expect(net, isNot(isA<AuthException>()));
    });
  });
}
