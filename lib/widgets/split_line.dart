import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalSplitLineWidget extends StatelessWidget {
  const NormalSplitLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.w,
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.12)),
    );
  }
}

class StrongSplitLineWidget extends StatelessWidget {
  const StrongSplitLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.w,
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.24)),
    );
  }
}
