import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/app/init/_init.dart';
import 'package:template_app/app/services/theme/_theme.dart';
import 'package:template_app/app/utils/_utils.dart';
import 'package:template_app/localization/cubit/language_cubit.dart';
import 'package:template_app/localization/generated/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => context.theme),
        BlocProvider(create: (_) => context.language),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, languageState) {
            return MaterialApp.router(
              scrollBehavior: CustomScrollBehavior(),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: context.language.state.locale,
              routerConfig: router,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: context.theme.state.themeMode,
            );
          },
        );
      },
    );
  }
}
