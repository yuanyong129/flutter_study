// // logo与标题
// import 'package:flutter/material.dart';
// import 'package:baoquan_app/common/index.dart';

// class LogoTitleWidget extends StatelessWidget {
//   const LogoTitleWidget({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.only(left: 15, top: 49),
//         margin: const EdgeInsets.only(bottom: 23),
//         child: Row(children: [
//           Container(
//               width: 33,
//               height: 33,
//               margin: const EdgeInsets.only(right: 11),
//               child: MyImages.logoIcon),
//           Text(
//             title,
//             style: const TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.bold, height: 1),
//           )
//         ]));
//   }
// }
