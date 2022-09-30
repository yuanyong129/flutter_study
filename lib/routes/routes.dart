import 'package:flutter/material.dart';
import 'package:ruixing_app/pages/home/index.dart';
import 'package:ruixing_app/pages/start.dart';
import 'package:ruixing_app/pages/login.dart';
import 'package:ruixing_app/pages/register.dart';

class RoutesName {
  static const String start = '/start';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutesMap() {
    return {
      start: (context) => const StartPage(),
      login: (context) => const LoginPage(),
      register: (context) => const RegisterPage(),
      home: (context) => const HomePage()
    };
  }

  static WidgetBuilder getRouteBuilder(String route) {
    switch (route) {
      case start:
        return (context) => const StartPage();
      case login:
        return (context) => const LoginPage();
      case register:
        return (context) => const RegisterPage();
      case home:
        return (context) => const HomePage();
      default:
        return (context) => const StartPage();
    }
  }
}
