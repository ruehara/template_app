import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:template_app/modules/auth/pages/login_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  // redirect: (context, state) {
  //   final isAuthenticated = GetIt.instance<AppSharedPreferences>()
  //       .isAuthenticated();
  //   final isLoginRoute = state.matchedLocation == '/login';

  //   // If not authenticated and not on login page, redirect to login
  //   if (!isAuthenticated && !isLoginRoute) {
  //     return '/login';
  //   }

  //   // If authenticated and on login page, redirect to home
  //   if (isAuthenticated && isLoginRoute) {
  //     return '/home';
  //   }

  //   // No redirect needed
  //   return null;
  // },
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
