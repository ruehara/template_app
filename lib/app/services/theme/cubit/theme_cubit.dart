import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/app/init/_init.dart';
import 'package:template_app/app/services/shared_prefs/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(
        ThemeState(themeMode: getIt<AppSharedPreferences>().getThemeMode()),
      );

  void updateAppTheme() async {
    getIt<AppSharedPreferences>().getThemeMode() == ThemeMode.light
        ? setTheme(ThemeMode.dark)
        : setTheme(ThemeMode.light);
  }

  void setTheme(ThemeMode themeMode) async {
    getIt<AppSharedPreferences>().setThemeMode(
      themeMode == ThemeMode.light ? 'light' : 'dark',
    );
    emit(
      ThemeState(
        themeMode: themeMode == ThemeMode.light
            ? ThemeMode.light
            : ThemeMode.dark,
      ),
    );
  }
}
