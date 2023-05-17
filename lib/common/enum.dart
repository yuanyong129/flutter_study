import 'package:flutter/material.dart';
import 'package:ruixing_app/common/theme.dart';

enum TokenKeys { token }

class ToastType {
  static const String primary = 'primary';
  static const String error = 'error';
  static const String success = 'success';
  static const String warning = 'warning';

  static Color getColor(String type) {
    switch (type) {
      case primary:
        return MainColors.primary;
      case error:
        return MainColors.errorColor;
      case success:
        return MainColors.successColor;
      case warning:
        return MainColors.warningColor;
      default:
        return MainColors.primary;
    }
  }
}

enum RoleType {
  customer,
  driver,
}
