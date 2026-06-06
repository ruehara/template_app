/// Semantic error categories thrown by the data layer.
///
/// The data layer never builds user-facing text: it throws an [AppException]
/// carrying one of these codes, and the UI translates it through
/// `AppLocalizations.messageFor` (see `core/services/localization/l10n.dart`).
enum AppErrorCode {
  invalidCredentials,
  notAuthenticated,
  userNotFound,
  userAlreadyExists,
  noUnit,
  noProfile,
  noTeam,
  database,
  network,
  unknown,
}

sealed class AppException implements Exception {
  const AppException(this.code, {this.details});

  /// Semantic, localizable error category.
  final AppErrorCode code;

  /// Technical detail kept for logging only — never shown to the user.
  final String? details;

  @override
  String toString() => details == null
      ? 'AppException(${code.name})'
      : 'AppException(${code.name}): $details';
}

final class AuthException extends AppException {
  const AuthException(super.code, {super.details});
}

final class DatabaseException extends AppException {
  const DatabaseException(super.code, {super.details});
}

final class NetworkException extends AppException {
  const NetworkException(super.code, {super.details});
}

/// Maps any thrown object to a semantic [AppErrorCode], defaulting to
/// [AppErrorCode.unknown] for errors that did not originate in our data layer.
AppErrorCode errorCodeOf(Object error) =>
    error is AppException ? error.code : AppErrorCode.unknown;
