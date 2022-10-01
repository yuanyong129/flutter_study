// import 'package:flutter/material.dart';
// import 'package:baoquan_app/widgets/logo_title.dart';
// import 'package:baoquan_app/common/index.dart';

// class MinePage extends StatefulWidget {
//   const MinePage({Key? key}) : super(key: key);

//   @override
//   State<MinePage> createState() => _MinePageState();
// }

// class _MinePageState extends State<MinePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xFFf8fafd),
//         body: SingleChildScrollView(
//             child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Container(child: MyImages.commonBg),
//             Positioned(
//                 child: Column(children: [
//               const LogoTitleWidget(
//                 title: '个人中心',
//               ),
//               AvatarNameWidget(
//                 avatar: MyImages.defaultAvatar,
//                 name: '王永胜',
//                 job: '安全操作员',
//               ),
//               const PersonalInfoWidget(
//                   username: '13612345678', imei: '12345678978787'),
//               Container(
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(18))),
//                   width: 370,
//                   height: 50,
//                   child: TextButton(
//                       onPressed: () {
//                         Navigator.popAndPushNamed(context, '/login');
//                       },
//                       style: TextButton.styleFrom(
//                           shape: const RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16))),
//                           backgroundColor: const Color(0xFFFFFFFF)),
//                       child: const Text('退出登录',
//                           style: TextStyle(
//                               color: Color(0xFF1D6FE9), fontSize: 20))))
//             ]))
//           ],
//         )));
//   }
// }

// class AvatarNameWidget extends StatelessWidget {
//   const AvatarNameWidget(
//       {Key? key, required this.avatar, required this.name, required this.job})
//       : super(key: key);
//   final Image avatar;
//   final String name;
//   final String job;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 19, left: 19, right: 19, bottom: 22),
//       child: Row(
//         children: [
//           Container(
//             width: 72,
//             height: 72,
//             decoration: const BoxDecoration(
//                 color: Color(0xFFFFFFFF),
//                 borderRadius: BorderRadius.all(Radius.circular(36))),
//             child: avatar,
//           ),
//           Container(
//               margin: const EdgeInsets.only(left: 17),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(name,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF111A34),
//                             fontSize: 20)),
//                     Padding(
//                         padding: const EdgeInsets.only(top: 4),
//                         child: Text(job,
//                             style: const TextStyle(color: Color(0xFF858B9C))))
//                   ]))
//         ],
//       ),
//     );
//   }
// }

// class PersonalInfoWidget extends StatelessWidget {
//   const PersonalInfoWidget(
//       {Key? key, required this.username, required this.imei})
//       : super(key: key);
//   final String username;
//   final String imei;

//   final TextStyle _titleStyle =
//       const TextStyle(color: Color(0xFF111A34), fontSize: 16);

//   final TextStyle _valueStyle =
//       const TextStyle(color: Color(0xFF858B9C), fontSize: 15);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           color: Color(0xFFFFFFFF),
//           borderRadius: BorderRadius.all(Radius.circular(17))),
//       width: 370,
//       margin: const EdgeInsets.only(bottom: 25),
//       padding: const EdgeInsets.all(18),
//       child: Column(
//         children: [
//           Flex(direction: Axis.horizontal, children: [
//             Container(
//               margin: const EdgeInsets.only(right: 10),
//               width: 35,
//               height: 35,
//               child: MyImages.usernameMine,
//             ),
//             Text('账号', style: _titleStyle),
//             Expanded(
//                 child: Text(username,
//                     textAlign: TextAlign.right, style: _valueStyle))
//           ]),
//           Container(
//             margin: const EdgeInsets.only(top: 18, bottom: 18),
//             decoration:
//                 const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.12)),
//             height: 1,
//           ),
//           Flex(direction: Axis.horizontal, children: [
//             Container(
//               margin: const EdgeInsets.only(right: 10),
//               width: 35,
//               height: 35,
//               child: MyImages.imeiMine,
//             ),
//             Text('IMEI号', style: _titleStyle),
//             Expanded(
//                 child:
//                     Text(imei, textAlign: TextAlign.right, style: _valueStyle))
//           ])
//         ],
//       ),
//     );
//   }
// }
