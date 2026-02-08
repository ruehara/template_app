import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/core/services/shared_prefs/shared_preferences.dart';
import 'package:template_app/core/services/theme/cubit/theme_cubit.dart';
import 'package:template_app/core/services/localization/cubit/language_cubit.dart';
import 'package:template_app/core/services/localization/generated/app_localizations.dart';
import 'package:template_app/modules/counter/view/counter_page.dart';
import '../../helpers/mock_shared_preferences.dart';
import '../../helpers/test_helpers.dart';

class MockThemeCubit extends Mock implements ThemeCubit {}

class MockLanguageCubit extends Mock implements LanguageCubit {}

void main() {
  late MockAppSharedPreferences mockPrefs;
  late MockThemeCubit mockThemeCubit;
  late MockLanguageCubit mockLanguageCubit;

  setUp(() {
    resetGetIt();
    mockPrefs = MockAppSharedPreferences();
    mockThemeCubit = MockThemeCubit();
    mockLanguageCubit = MockLanguageCubit();

    GetIt.instance.registerSingleton<AppSharedPreferences>(mockPrefs);
    GetIt.instance.registerSingleton<ThemeCubit>(mockThemeCubit);
    GetIt.instance.registerSingleton<LanguageCubit>(mockLanguageCubit);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('CounterPage Widget Tests', () {
    testWidgets('CounterPage renders correctly', (WidgetTester tester) async {
      // Build our widget
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [AppLocalizations.delegate],
          supportedLocales: AppLocalizations.supportedLocales,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<ThemeCubit>.value(value: mockThemeCubit),
              BlocProvider<LanguageCubit>.value(value: mockLanguageCubit),
            ],
            child: const CounterPage(),
          ),
        ),
      );

      // Verify the CounterPage renders
      expect(find.byType(CounterPage), findsOneWidget);
      expect(find.byType(CounterView), findsOneWidget);
    });

    testWidgets('CounterPage displays a Scaffold', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [AppLocalizations.delegate],
          supportedLocales: AppLocalizations.supportedLocales,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<ThemeCubit>.value(value: mockThemeCubit),
              BlocProvider<LanguageCubit>.value(value: mockLanguageCubit),
            ],
            child: const CounterPage(),
          ),
        ),
      );

      // Verify Scaffold is present
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
