import 'package:flutter/material.dart';
import 'package:baoquan_app/common/index.dart';

Color getEquipmentStatusColor(String status) {
  switch (status) {
    case EquipmentStatus.running:
      return EquipmentStatusColor.runing;
    case EquipmentStatus.standby:
      return EquipmentStatusColor.standby;
    case EquipmentStatus.warning:
      return EquipmentStatusColor.warning;
    default:
      return EquipmentStatusColor.standby;
  }
}

String getEquipmentStatusLabel(String status) {
  switch (status) {
    case EquipmentStatus.running:
      return '运行';
    case EquipmentStatus.standby:
      return '待机';
    case EquipmentStatus.warning:
      return '告警';
    default:
      return '待机';
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
