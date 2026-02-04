import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/app/init/injection.dart';
import 'package:template_app/app/services/shared_prefs/shared_preferences.dart';
import 'package:template_app/app/services/theme/cubit/theme_cubit.dart';
import 'package:template_app/app/utils/exit_dialog.dart';
import 'package:template_app/localization/cubit/language_cubit.dart';
import 'package:template_app/localization/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterView();
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<AppExitResponse> didRequestAppExit() async {
    AppExitResponse response = AppExitResponse.cancel;
    if (context.mounted) {
      response = await ExitPopupDialog.show(
        context,
      ).then((value) => value ? AppExitResponse.exit : AppExitResponse.cancel);
    }
    if (response == AppExitResponse.cancel) {
      return response;
    } else {
      exit(0);
    }
  }

  Future<bool> exitApp() async {
    if (!context.canPop()) {
      bool ret = await ExitPopupDialog.show(
        context,
      ).then((value) => value ? true : false);
      if (ret) {
        exit(0);
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        exitApp();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(l10n.counterAppBarTitle)),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              tooltip: 'Perfil',
              onPressed: () => context.pushNamed('profile'),
            ),
          ],
        ),
        body: Container(),
        floatingActionButton: Column(
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
            // Test crash FAB: triggers an async exception to test reporting
            FloatingActionButton(
              elevation: 2.0,
              heroTag: const Text('crash_test'),
              tooltip: 'Trigger test exception',
              backgroundColor: Colors.red,
              onPressed: () {
                // Throwing inside a microtask/asynchronous callback so runZonedGuarded captures it
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
        ),
      ),
    );
  }
}
