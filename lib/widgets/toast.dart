import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruixing_app/common/enum.dart';

SnackBar toast(String content, {String type = ToastType.error}) {
  return SnackBar(
      backgroundColor: ToastType.getColor(type),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.w),
      content: Text(content, style: const TextStyle(color: Colors.white)));
}
