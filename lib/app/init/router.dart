import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:go_router/go_router.dart';
import 'package:template_app/app/services/shared_prefs/shared_preferences.dart';
import 'package:template_app/modules/auth/model/auth_user_model.dart';
import 'package:template_app/modules/auth/pages/create_user_page.dart';
import 'package:template_app/modules/auth/pages/edit_user_page.dart';
import 'package:template_app/modules/auth/pages/login_page.dart';
import 'package:template_app/modules/auth/pages/profile_page.dart';
import 'package:template_app/modules/contato/pages/contato_page.dart';
import 'package:template_app/modules/contato/pages/contato_page2.dart';
import 'package:template_app/modules/counter/view/counter_page.dart';
import 'package:template_app/modules/user/model/user_model.dart';
import 'package:template_app/modules/user/pages/user_page.dart';
import 'package:template_app/modules/user/pages/user_page_detail.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    final isAuthenticated = GetIt.instance<AppSharedPreferences>()
        .isAuthenticated();
    final currentPath = state.uri.path;
    final isLoginRoute = currentPath == '/login';
    final isRegisterRoute = currentPath == '/register';

    // If not authenticated and not on login/register page, redirect to login
    if (!isAuthenticated && !isLoginRoute && !isRegisterRoute) {
      return '/login';
    }

    // If authenticated and on login/register page, redirect to counter
    if (isAuthenticated && (isLoginRoute || isRegisterRoute)) {
      return '/counter';
    }

    // No redirect needed
    return null;
  },
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
    GoRoute(
      path: '/register',
      name: 'register',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const CreateUserPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),

    GoRoute(
      path: '/counter',
      name: 'counter',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const CounterPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const ProfilePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/edit-profile',
      name: 'edit-profile',
      pageBuilder: (context, state) {
        final user = state.extra as AuthUserModel;
        return CustomTransitionPage(
          key: state.pageKey,
          child: EditUserPage(user: user),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/userlist',
      name: 'userlist',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const UserPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/userdetail',
      name: 'userdetail',
      pageBuilder: (context, state) {
        UserModel sample = state.extra as UserModel;
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 400),
          key: state.pageKey,
          child: UserDetail(object: sample),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(
                curve: Curves.linearToEaseOut,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/contato',
      name: 'contato',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const ContatoPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/contato2',
      name: 'contato2',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const ContatoPage2(),
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
