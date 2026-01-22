import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/app/init/_init.dart';
import 'package:template_app/app/services/shared_prefs/shared_preferences.dart';

import 'languages.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
    : super(LanguageState(locale: getIt<AppSharedPreferences>().getLocale()));

  void updateAppLocale() async {
    getIt<AppSharedPreferences>().getLocale() == AppLanguage.portuguese
        ? setLocale(AppLanguage.english)
        : setLocale(AppLanguage.portuguese);
  }

  void setLocale(Locale locale) async {
    getIt<AppSharedPreferences>().setLocale(
      locale == AppLanguage.portuguese
          ? AppLanguage.portuguese
          : AppLanguage.english,
    );
    emit(
      LanguageState(
        locale: locale == AppLanguage.portuguese
            ? AppLanguage.portuguese
            : AppLanguage.english,
      ),
    );
  }
}
