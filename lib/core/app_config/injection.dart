import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_app/core/services/logger/logger_service.dart';
import 'package:template_app/core/services/shared_prefs/shared_preferences.dart';
import 'package:template_app/core/services/theme/_theme.dart';
import 'package:template_app/core/database/connection/connection.dart';
import 'package:template_app/core/database/database.dart';
import 'package:template_app/core/services/localization/cubit/language_cubit.dart';
import 'package:template_app/modules/auth/blocs/auth_bloc.dart';
import 'package:template_app/modules/auth/repository/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> loadServiceLocator() async {
  getIt.registerLazySingleton<LoggerService>(() => LoggerService());
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  getIt.registerSingleton<AppSharedPreferences>(AppSharedPreferencesImpl());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  getIt.registerSingleton<Database>(Database(DatabaseConnection(connect())));
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      database: getIt<Database>(),
      prefs: getIt<AppSharedPreferences>(),
    ),
  );
  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(getIt<AuthRepository>()),
  );
}
