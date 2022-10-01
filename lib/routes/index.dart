import 'package:fluent_ui/fluent_ui.dart';
// import 'package:baoquan_app/pages/home.dart';
import 'package:baoquan_app/pages/login.dart';
// import 'package:baoquan_app/pages/equipment.dart';
// import 'package:baoquan_app/pages/temperature.dart';
// import 'package:baoquan_app/pages/warning_info.dart';

Map<String, WidgetBuilder> routes = {
  '/login': (context) => const LoginPage(),
  // '/home': (context) => const HomePage(),
  // '/equipment': (context) => const EquipmentPage(),
  // '/temperature': (context) => const TemperaturePage(),
  // '/warning_info': (context) => const WarningInfoPage()
};

/// the class
class Routes {
  static String login = '/login';
  static String home = '/home';
  static String equipment = '/equipment';
  static String temperature = '/temperature';
  static String warningInfo = '/warning_info';
}
