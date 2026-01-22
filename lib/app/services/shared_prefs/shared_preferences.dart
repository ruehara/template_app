import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_app/app/init/_init.dart';
import 'package:template_app/app/services/theme/_theme.dart';
import 'package:template_app/app/utils/_utils.dart';
import 'package:template_app/localization/cubit/language_cubit.dart';

abstract class AppSharedPreferences {
  Locale getLocale();
  ThemeMode getThemeMode();
  String? getAuthUserId();
  bool isAuthenticated();

  void setLocale(Locale locale);
  void setThemeMode(String theme);
  void setAuthUserId(String userId);
  void clearAuth();

  void clearAll();
  void removeTheme();
  void removeLocale();
}

class AppSharedPreferencesImpl extends AppSharedPreferences {
  SharedPreferences get sharedPrefs => getIt<SharedPreferences>();

  @override
  Locale getLocale() {
    return Locale(sharedPrefs.getString(localeVar) ?? 'pt');
  }

  @override
  ThemeMode getThemeMode() {
    return sharedPrefs.getString(themeVar) == 'dark'
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  @override
  void clearAll() {
    removeLocale();
    removeTheme();
  }

  @override
  void setLocale(Locale locale) {
    sharedPrefs.setString(localeVar, locale.languageCode);
  }

  @override
  void setThemeMode(String theme) {
    sharedPrefs.setString(themeVar, theme);
  }

  @override
  void removeLocale() {
    sharedPrefs.remove(localeVar);
    getIt<LanguageCubit>().setLocale(getLocale());
  }

  @override
  void removeTheme() {
    sharedPrefs.remove(themeVar);
    getIt<ThemeCubit>().setTheme(getThemeMode());
  }

  @override
  String? getAuthUserId() {
    return sharedPrefs.getString(authUserIdVar);
  }

  @override
  bool isAuthenticated() {
    return getAuthUserId() != null;
  }

  @override
  void setAuthUserId(String userId) {
    sharedPrefs.setString(authUserIdVar, userId);
  }

  @override
  void clearAuth() {
    sharedPrefs.remove(authUserIdVar);
  }
}
