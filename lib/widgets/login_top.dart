import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ruixing_app/common/image.dart';

class LoginTop extends StatelessWidget {
  const LoginTop({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 40.w),
        alignment: Alignment.topLeft,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: 169.w,
            height: 45.w,
            child: MyImages.logo,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: Text(title,
                  style:
                      TextStyle(fontSize: 52.w, fontWeight: FontWeight.bold))),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.grey, fontSize: 28.w),
            ),
          ),
        ]));
  }
}
