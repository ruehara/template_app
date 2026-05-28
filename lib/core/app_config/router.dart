import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/core/app_config/app_routes.dart';
import 'package:template_app/core/services/shared_prefs/shared_preferences.dart';
import 'package:template_app/modules/auth/auth.dart';
import 'package:template_app/modules/biometric/biometric.dart';
import 'package:template_app/modules/charts/charts.dart';
import 'package:template_app/modules/contato/contato.dart';
import 'package:template_app/modules/counter/counter.dart';
import 'package:template_app/modules/home/home.dart';
import 'package:template_app/modules/lotties/lotties.dart';
import 'package:template_app/modules/network/network.dart';
import 'package:template_app/modules/qrcode/qrcode.dart';
import 'package:template_app/modules/sensors/sensors.dart';
import 'package:template_app/modules/user/user.dart';

CustomTransitionPage<void> _fadePage(
  GoRouterState state,
  Widget child, {
  Curve curve = Curves.easeInOut,
  Duration duration = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (_, animation, _, child) => FadeTransition(
      opacity: CurveTween(curve: curve).animate(animation),
      child: child,
    ),
  );
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,
  redirect: (context, state) {
    final isAuthenticated = GetIt.instance<AppSharedPreferences>()
        .isAuthenticated();
    final path = state.uri.path;
    final isAuthRoute = path == AppRoutes.login || path == AppRoutes.register;

    if (!isAuthenticated && !isAuthRoute) return AppRoutes.login;
    if (isAuthenticated && isAuthRoute) return AppRoutes.home;
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.loginName,
      pageBuilder: (_, state) => _fadePage(state, const LoginPage()),
    ),
    GoRoute(
      path: AppRoutes.register,
      name: AppRoutes.registerName,
      pageBuilder: (_, state) => _fadePage(state, const CreateUserPage()),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.homeName,
      pageBuilder: (_, state) => _fadePage(state, const HomePage()),
    ),
    GoRoute(
      path: AppRoutes.counter,
      name: AppRoutes.counterName,
      pageBuilder: (_, state) => _fadePage(state, const CounterPage()),
    ),
    GoRoute(
      path: AppRoutes.profile,
      name: AppRoutes.profileName,
      pageBuilder: (_, state) => _fadePage(state, const ProfilePage()),
    ),
    GoRoute(
      path: AppRoutes.editProfile,
      name: AppRoutes.editProfileName,
      pageBuilder: (_, state) =>
          _fadePage(state, EditUserPage(user: state.extra as AuthUserModel)),
    ),
    GoRoute(
      path: AppRoutes.userList,
      name: AppRoutes.userListName,
      pageBuilder: (_, state) => _fadePage(state, const UserPage()),
    ),
    GoRoute(
      path: AppRoutes.userDetail,
      name: AppRoutes.userDetailName,
      pageBuilder: (_, state) => _fadePage(
        state,
        UserDetail(object: state.extra as UserModel),
        curve: Curves.linearToEaseOut,
        duration: const Duration(milliseconds: 400),
      ),
    ),
    GoRoute(
      path: AppRoutes.contato,
      name: AppRoutes.contatoName,
      pageBuilder: (_, state) => _fadePage(state, const ContatoPage()),
    ),
    GoRoute(
      path: AppRoutes.contato2,
      name: AppRoutes.contato2Name,
      pageBuilder: (_, state) => _fadePage(state, const ContatoPage()),
    ),
    GoRoute(
      path: AppRoutes.network,
      name: AppRoutes.networkName,
      pageBuilder: (_, state) => _fadePage(state, const NetworkPage()),
    ),
    GoRoute(
      path: AppRoutes.biometric,
      name: AppRoutes.biometricName,
      pageBuilder: (_, state) => _fadePage(state, const BiometricPage()),
    ),
    GoRoute(
      path: AppRoutes.sensors,
      name: AppRoutes.sensorsName,
      pageBuilder: (_, state) => _fadePage(state, const SensorsPage()),
    ),
    GoRoute(
      path: AppRoutes.qrCode,
      name: AppRoutes.qrCodeName,
      pageBuilder: (_, state) => _fadePage(state, const QrCodePage()),
    ),
    GoRoute(
      path: AppRoutes.charts,
      name: AppRoutes.chartsName,
      pageBuilder: (_, state) => _fadePage(state, const ChartsPage()),
    ),
    GoRoute(
      path: AppRoutes.lotties,
      name: AppRoutes.lottiesName,
      pageBuilder: (_, state) => _fadePage(state, const LottiesPage()),
    ),
  ],
);
