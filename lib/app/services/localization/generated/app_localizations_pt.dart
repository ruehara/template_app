// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get counterAppBarTitle => 'Contador';

  @override
  String get counterInfo => 'O valor está em:';

  @override
  String get reset => 'Reseta os valores';

  @override
  String get language => 'Altera a linguagem';

  @override
  String get theme => 'Altera o tema';

  @override
  String get increment => 'Incrementa';

  @override
  String get decrement => 'Decrementa';

  @override
  String get exit => 'Sair do App';

  @override
  String get exit_msg => 'Deseja realmente sair do App?';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get list_title => 'Lista Exemplo';

  @override
  String get detail_title => 'Detalhe';

  @override
  String get edit_profile => 'Editar Perfil';
}
