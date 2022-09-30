import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruixing_app/common/text.dart';

class CommonListItem extends StatelessWidget {
  const CommonListItem(
      {Key? key,
      required this.labelText,
      this.labelWidth,
      this.suffix,
      this.margin,
      this.decoration})
      : super(key: key);
  final String labelText;
  final double? labelWidth;
  final Widget? suffix;
  final BoxDecoration? decoration;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: decoration,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10.w),
            width: labelWidth,
            child: Text(
              labelText,
              style: CustomTextStyles.secondaryLabelStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: suffix,
            ),
          )
        ],
      ),
    );
  }
}
