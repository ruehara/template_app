import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/core/app_config/app_routes.dart';
import 'package:template_app/core/services/localization/l10n.dart';
import 'package:template_app/core/utils/exit_dialog.dart';
import 'package:template_app/modules/counter/blocs/counter_bloc.dart';
import 'package:template_app/modules/counter/blocs/counter_events.dart';
import 'package:template_app/modules/counter/blocs/counter_states.dart';
import 'counter_fabs.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
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
      response = await ExitPopupDialog.show(context).then(
        (value) => (value as bool? ?? false)
            ? AppExitResponse.exit
            : AppExitResponse.cancel,
      );
    }
    if (response == AppExitResponse.cancel) {
      return response;
    } else {
      exit(0);
    }
  }

  Future<bool> exitApp() async {
    if (!context.canPop()) {
      final bool ret = await ExitPopupDialog.show(
        context,
      ).then((value) => (value as bool?) ?? false);
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
              tooltip: l10n.profileLabel,
              onPressed: () => context.pushNamed(AppRoutes.profileName),
            ),
          ],
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            final theme = Theme.of(context);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.counterInfo,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${state.count}',
                    style: theme.textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton.tonal(
                        onPressed: () => context
                            .read<CounterBloc>()
                            .add(const CounterDecremented()),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.remove,
                            semanticLabel: l10n.decrement,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      FilledButton(
                        onPressed: () => context
                            .read<CounterBloc>()
                            .add(const CounterIncremented()),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.add,
                            semanticLabel: l10n.increment,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextButton.icon(
                    onPressed: () => context
                        .read<CounterBloc>()
                        .add(const CounterReset()),
                    icon: const Icon(Icons.refresh, size: 18),
                    label: Text(l10n.reset),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: const CounterFabs(),
      ),
    );
  }
}
