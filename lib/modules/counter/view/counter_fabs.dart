import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/core/app_config/injection.dart';
import 'package:template_app/core/services/localization/cubit/language_cubit.dart';
import 'package:template_app/core/services/localization/l10n.dart';
import 'package:template_app/core/services/shared_prefs/shared_preferences.dart';
import 'package:template_app/core/services/theme/cubit/theme_cubit.dart';

class CounterFabs extends StatelessWidget {
  const CounterFabs({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          elevation: 1.5,
          heroTag: const Text('db2'),
          mini: true,
          onPressed: () => context.pushNamed('contato2'),
          child: const Icon(Icons.accessibility_new),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          elevation: 1.5,
          heroTag: const Text('teste'),
          mini: true,
          onPressed: () => context.pushNamed('userlist'),
          child: const Icon(Icons.arrow_forward),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          elevation: 1.5,
          heroTag: Text(l10n.reset),
          tooltip: l10n.reset,
          mini: true,
          onPressed: () => getIt<AppSharedPreferences>().clearAll(),
          child: const Icon(Icons.clear),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          elevation: 1.5,
          heroTag: Text(l10n.language),
          tooltip: l10n.language,
          mini: true,
          onPressed: () => context.language.updateAppLocale(),
          child: const Icon(Icons.language),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          elevation: 1.5,
          heroTag: Text(l10n.theme),
          tooltip: l10n.theme,
          mini: true,
          onPressed: () => context.theme.updateAppTheme(),
          child: const Icon(Icons.dark_mode),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          elevation: 2.0,
          heroTag: const Text('crash_test'),
          tooltip: l10n.testCrashTooltip,
          backgroundColor: Colors.red,
          onPressed: () {
            Future.delayed(Duration.zero, () {
              throw Exception(
                'Teste: exceção acionada pelo FAB de teste (CounterPage)',
              );
            });
          },
          child: const Icon(Icons.bug_report),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
