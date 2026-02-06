// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get counterAppBarTitle => 'Counter';

  @override
  String get counterInfo => 'The value is at:';

  @override
  String get reset => 'Reset values';

  @override
  String get language => 'Change the language';

  @override
  String get theme => 'Change the theme';

  @override
  String get increment => 'Increment';

  @override
  String get decrement => 'Decrement';

  @override
  String get exit => 'Exit the App';

  @override
  String get exit_msg => 'Do you want to exit the App?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get list_title => 'List Example';

  @override
  String get detail_title => 'Detail';

  @override
  String get edit_profile => 'Edit Profile';
}
