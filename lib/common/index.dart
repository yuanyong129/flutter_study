import 'package:flutter/cupertino.dart';

class MyImages {
  static Image fireIcon = Image.asset('lib/assets/images/fire.png');
  static Image commonBg = Image.asset('lib/assets/images/login-kazari.png');
  static Image logoIcon = Image.asset('lib/assets/images/logo.png');
  static Image optionsActiveIcon =
      Image.asset('lib/assets/images/options-active.png');
  static Image optionsInactiveIcon =
      Image.asset('lib/assets/images/options-inactive.png');
  static Image mineAvticeIcon =
      Image.asset('lib/assets/images/mine-active.png');
  static Image mineInavticeIcon =
      Image.asset('lib/assets/images/mine-inactive.png');
  static Image homeCardBg = Image.asset('lib/assets/images/home-card.png');
  static Image homeEquipmentIcon =
      Image.asset('lib/assets/images/equipment.png');
  static Image homeWarningIcon = Image.asset('lib/assets/images/warning.png');
  static Image defaultAvatar =
      Image.asset('lib/assets/images/default-avatar.png');
  static Image usernameMine =
      Image.asset('lib/assets/images/username-mine.png');
  static Image imeiMine = Image.asset('lib/assets/images/imei-mine.png');
  static Image equipmentImage =
      Image.asset('lib/assets/images/equipment-img.png');
  static Image recordTemperature =
      Image.asset('lib/assets/images/card-temperature.png');
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
