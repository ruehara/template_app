import 'package:flutter/widgets.dart';
import 'package:template_app/core/services/localization/generated/app_localizations.dart';
import 'package:template_app/core/utils/exceptions.dart';

export 'package:template_app/core/services/localization/generated/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Translates a semantic [AppErrorCode] into a localized, user-facing message.
extension AppErrorMessageX on AppLocalizations {
  String messageFor(AppErrorCode code) => switch (code) {
    AppErrorCode.invalidCredentials => errorInvalidCredentials,
    AppErrorCode.notAuthenticated => errorNotAuthenticated,
    AppErrorCode.userNotFound => errorUserNotFound,
    AppErrorCode.userAlreadyExists => errorUserAlreadyExists,
    AppErrorCode.noUnit => errorNoUnit,
    AppErrorCode.noProfile => errorNoProfile,
    AppErrorCode.noTeam => errorNoTeam,
    AppErrorCode.database => errorDatabase,
    AppErrorCode.network => errorNetwork,
    AppErrorCode.unknown => errorUnexpected,
  };
}
