import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainColors {
  static Color primary = const Color(0xFF1D6FE9);
  static Color textLinkColor = const Color(0xFF5878B4);
  static Color errorColor = const Color(0xFFFF5B60);
  static Color successColor = const Color(0xFF28AA91);
  static Color warningColor = const Color(0xFFFF7D41);
  static Color suggestColor = const Color(0xFF4EBBF5);
  static var colorFF111A34 = const Color(0xFF111A34);
  static var colorFF41485D = const Color(0xFF41485D);
  static var colorFF666F83 = const Color(0xFF666F83);
  static var colorFF858B9C = const Color(0xFF858B9C);
  static var colorFF858C9C = const Color(0xFF858C9C);
  static var colorFFC5CAD5 = const Color(0xFFC5CAD5);
  static var colorFFE2E4EA = const Color(0xFFE2E4EA);
  static var opacityColorWhite9 = const Color.fromRGBO(255, 255, 255, 0.9);
  static var opacityColorWhite8 = const Color.fromRGBO(255, 255, 255, 0.8);
  static var opacityColorWhite6 = const Color.fromRGBO(255, 255, 255, 0.6);
  static var opacityColorWhite4 = const Color.fromRGBO(255, 255, 255, 0.4);
}

class MainStyles {
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(670.w, 100.w),
      // primary: MainColors.primary,
      textStyle: TextStyle(fontSize: MainFontSize.fs36),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)));

  static ButtonStyle primaryOutlinedButtonStyle = OutlinedButton.styleFrom(
      minimumSize: Size(670.w, 100.w),
      // primary: MainColors.primary,
      textStyle: TextStyle(fontSize: MainFontSize.fs36),
      // side: BorderSide(color: MainColors.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)));
}

class MainFontSize {
  static var fs60 = 60.w;
  static var fs52 = 52.w;
  static var fs48 = 48.w;
  static var fs40 = 40.w;
  static var fs36 = 36.w;
  static var fs32 = 32.sp;
  static var fs30 = 30.sp;
  static var fs28 = 28.w;
  static var fs26 = 26.w;
  static var fs24 = 24.w;
  static var fs20 = 20.w;
  static var fs16 = 16.w;
}
