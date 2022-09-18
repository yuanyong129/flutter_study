import 'package:flutter/material.dart';
import 'package:ruixing_app/pages/home.dart';
import 'package:ruixing_app/pages/login.dart';
import 'package:ruixing_app/pages/register.dart';

class RoutesName {
  static String home = '/home';
  static String login = '/login';
  static String register = '/register';
}

Map<String, WidgetBuilder> routes = {
  RoutesName.home: (context) => const HomePage(),
  RoutesName.login: (context) => const LoginPage(),
  RoutesName.register: (context) => const RegisterPage()
};
