import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ruixing_app/pages/index.dart';
import 'package:ruixing_app/pages/start.dart';
import 'package:ruixing_app/pages/login.dart';
import 'package:ruixing_app/pages/register.dart';

class RoutesName {
  static const String start = '/start';
  static const String login = '/login';
  static const String register = '/register';
  static const String index = '/index';
}

class MyRouter {
  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const StartPage();
      },
    ),
    GoRoute(
      path: RoutesName.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: RoutesName.register,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: RoutesName.index,
      builder: (BuildContext context, GoRouterState state) {
        return const IndexPage();
      },
    )
  ]);
}
