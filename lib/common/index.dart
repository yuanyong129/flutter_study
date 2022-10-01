import 'package:flutter/cupertino.dart';

class MyImages {
  static var loginBg = Image.asset('assets/images/login_bg.png');
  static var loginCardLeft = Image.asset('assets/images/backend_backdrop.png');
}

class EquipmentStatus {
  static const running = '0';
  static const standby = '1';
  static const warning = '2';
}

class EquipmentStatusColor {
  static const runing = Color(0xFF28AA91);
  static const standby = Color(0xFF1D6FE9);
  static const warning = Color(0xFFFF5B60);
}
