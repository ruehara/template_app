import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:template_app/core/app_config/_app_config.dart';
import 'package:template_app/core/services/logger/logger_service.dart';
import 'package:template_app/core/utils/constants.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    if (getIt.isRegistered<LoggerService>()) {
      getIt<LoggerService>().logError(
        error,
        stackTrace,
        reason: 'Bloc Error in ${bloc.runtimeType}',
        sourceClass: bloc.runtimeType.toString(),
        sourceMethod: 'onError',
        extra: {'state': bloc.state?.toString()},
      );
    }
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    if (getIt.isRegistered<LoggerService>()) {
      getIt<LoggerService>().logError(
        details.exception,
        details.stack,
        reason: 'FlutterError',
        fatal: true,
        sourceClass: 'FlutterError',
        sourceMethod: 'onError',
        extra: {
          'context': details.context.toString(),
          'library': details.library,
          'summary': details.summary.toString(),
        },
      );
    }
  };

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      await initAppPath();
      await loadServiceLocator();
      await Maintenance.run();

      runApp(await builder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      if (getIt.isRegistered<LoggerService>()) {
        getIt<LoggerService>().logError(
          error,
          stackTrace,
          reason: 'Zone Guarded Error',
          fatal: true,
        );
      }
    },
  );
}
