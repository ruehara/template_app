sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;

  @override
  String toString() => message;
}

final class AuthException extends AppException {
  const AuthException(super.message);
}

final class DatabaseException extends AppException {
  const DatabaseException(super.message);
}

final class NetworkException extends AppException {
  const NetworkException(super.message);
}
