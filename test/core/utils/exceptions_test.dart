import 'package:flutter_test/flutter_test.dart';
import 'package:template_app/core/utils/exceptions.dart';

void main() {
  group('AppException hierarchy', () {
    test('AuthException stores code and optional details', () {
      const e = AuthException(AppErrorCode.invalidCredentials);
      expect(e.code, AppErrorCode.invalidCredentials);
      expect(e.details, isNull);
      expect(e, isA<AppException>());
      expect(e, isA<Exception>());
    });

    test('DatabaseException keeps technical details for logging', () {
      const e = DatabaseException(
        AppErrorCode.database,
        details: 'connection reset',
      );
      expect(e.code, AppErrorCode.database);
      expect(e.toString(), contains('connection reset'));
      expect(e, isA<AppException>());
    });

    test('NetworkException stores code', () {
      const e = NetworkException(AppErrorCode.network);
      expect(e.code, AppErrorCode.network);
      expect(e, isA<AppException>());
    });

    test('exception types are distinct', () {
      const auth = AuthException(AppErrorCode.invalidCredentials);
      const db = DatabaseException(AppErrorCode.database);
      const net = NetworkException(AppErrorCode.network);
      expect(auth, isNot(isA<DatabaseException>()));
      expect(db, isNot(isA<NetworkException>()));
      expect(net, isNot(isA<AuthException>()));
    });

    test('errorCodeOf maps unknown errors to AppErrorCode.unknown', () {
      expect(errorCodeOf(Exception('boom')), AppErrorCode.unknown);
      expect(
        errorCodeOf(const AuthException(AppErrorCode.notAuthenticated)),
        AppErrorCode.notAuthenticated,
      );
    });
  });
}
