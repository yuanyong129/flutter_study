// import 'dart:ui';

// import 'package:baoquan_app/utils/index.dart';
// import 'package:baoquan_app/widgets/title.dart';
// import 'package:baoquan_app/widgets/logo_title.dart';
// import 'package:flutter/material.dart';
// import 'package:baoquan_app/common/index.dart';

// class OptionsPage extends StatelessWidget {
//   const OptionsPage({Key? key}) : super(key: key);

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
//                 child: Column(
//               children: [
//                 const LogoTitleWidget(
//                   title: '宝泉生产管理系统',
//                 ),
//                 const TopCardWidget(),
//                 Container(
//                     width: 375,
//                     padding: const EdgeInsets.only(top: 20, bottom: 11.1),
//                     child: const TitleWidget(title: '设备管理')),
//                 const EquipmentListWidget()
//               ],
//             ))
//           ],
//         )));
//   }
// }

// // 上部卡片统计局
// class TopCardWidget extends StatefulWidget {
//   const TopCardWidget({Key? key}) : super(key: key);

//   @override
//   State<TopCardWidget> createState() => _TopCardWidgetState();
// }

// class _TopCardWidgetState extends State<TopCardWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(24, 27, 24, 0),
//       width: 375,
//       height: 228,
//       decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(13.0)),
//           image: DecorationImage(
//               image: MyImages.homeCardBg.image, fit: BoxFit.fill)),
//       child: Column(
//         children: [
//           Flex(
//             direction: Axis.horizontal,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TopCardUpItem(
//                   image: MyImages.homeEquipmentIcon,
//                   title: '窑炉设备',
//                   number: 15,
//                   unit: '个'),
//               Container(
//                 decoration: const BoxDecoration(
//                     color: Color.fromRGBO(255, 255, 255, 0.4)),
//                 width: 1,
//                 height: 26,
//               ),
//               TopCardUpItem(
//                   image: MyImages.homeWarningIcon,
//                   title: '异常告警',
//                   number: 36,
//                   unit: '次')
//             ],
//           ),
//           Container(
//               width: 327,
//               margin: const EdgeInsets.only(top: 20, bottom: 14),
//               child: const Text(
//                 '生产基础数据',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(fontSize: 16.7, color: Color(0xffffffff)),
//               )),
//           ClipRect(
//               child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                   child: Container(
//                       padding: const EdgeInsets.only(top: 12),
//                       width: 333.3,
//                       height: 66.67,
//                       decoration: const BoxDecoration(
//                           gradient: LinearGradient(colors: [
//                             Color.fromRGBO(255, 255, 255, 0.16),
//                             Color.fromRGBO(255, 255, 255, 0.09)
//                           ]),
//                           borderRadius: BorderRadius.all(Radius.circular(4.0))),
//                       child: Flex(
//                         direction: Axis.horizontal,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: const [
//                           TopCardDownItem(number: '26', title: '当日生产炉次'),
//                           TopCardDownItem(number: '26', title: '运行设备'),
//                           TopCardDownItem(number: '1', title: '告警设备')
//                         ],
//                       )))),
//           // Container(
//           //     padding: const EdgeInsets.only(top: 12),
//           //     width: 333.3,
//           //     height: 66.67,
//           //     decoration: const BoxDecoration(
//           //         gradient: LinearGradient(colors: [
//           //           Color.fromRGBO(255, 255, 255, 0.16),
//           //           Color.fromRGBO(255, 255, 255, 0.09)
//           //         ]),
//           //         borderRadius: BorderRadius.all(Radius.circular(4.0))),
//           //     child: Flex(
//           //       direction: Axis.horizontal,
//           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //       children: const [
//           //         TopCardDownItem(number: '26', title: '当日生产炉次'),
//           //         TopCardDownItem(number: '26', title: '运行设备'),
//           //         TopCardDownItem(number: '1', title: '告警设备')
//           //       ],
//           //     )),
//         ],
//       ),
//     );
//   }
// }

// // 卡片统计上部item
// class TopCardUpItem extends StatelessWidget {
//   const TopCardUpItem(
//       {Key? key,
//       required this.image,
//       required this.title,
//       required this.number,
//       required this.unit})
//       : super(key: key);

//   final Image image;
//   final String title;
//   final int number;
//   final String unit;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.only(left: 6, right: 9),
//           width: 50,
//           height: 50,
//           child: image,
//         ),
//         Column(children: [
//           Container(
//             margin: const EdgeInsets.only(bottom: 4.5),
//             child: Text(
//               title,
//               style: const TextStyle(color: Color(0xffffffff), fontSize: 13),
//             ),
//           ),
//           Row(
//             children: [
//               Text(number.toString(),
//                   style:
//                       const TextStyle(color: Color(0xffffffff), fontSize: 19)),
//               Container(
//                   margin: const EdgeInsets.only(left: 21),
//                   child: Text(unit,
//                       style: const TextStyle(
//                           color: Color.fromRGBO(255, 255, 255, 0.6),
//                           fontSize: 12)))
//             ],
//           )
//         ])
//       ],
//     );
//   }
// }

// // 卡片统计下部item
// class TopCardDownItem extends StatelessWidget {
//   const TopCardDownItem({Key? key, required this.number, required this.title})
//       : super(key: key);

//   final String number;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Text(number,
//           style: const TextStyle(
//               color: Color(0xffffffff), fontSize: 20, height: 1)),
//       Container(
//           margin: const EdgeInsets.only(top: 3),
//           child: Text(title,
//               style: const TextStyle(
//                   color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: 13.3)))
//     ]);
//   }
// }

// // 设备管理列表
// class EquipmentListWidget extends StatefulWidget {
//   const EquipmentListWidget({Key? key}) : super(key: key);
//   @override
//   State<EquipmentListWidget> createState() {
//     return _EquipmentListState();
//   }
// }

// class _EquipmentListState extends State<EquipmentListWidget> {
//   final List<Map<String, dynamic>> _equipmentList = [
//     {'id': '0', 'name': '窑炉设备#1', 'status': EquipmentStatus.running},
//     {'id': '1', 'name': '窑炉设备#2', 'status': EquipmentStatus.standby},
//     {'id': '2', 'name': '窑炉设备#3', 'status': EquipmentStatus.warning},
//     {'id': '3', 'name': '窑炉设备#4', 'status': EquipmentStatus.running}
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: _equipmentList
//           .map((item) => EquipmentItemWidget(
//               id: item['id'],
//               name: item['name'],
//               status: item['status'] ?? '0'))
//           .toList(),
//     );
//   }
// }

// // 设备管理Item
// class EquipmentItemWidget extends StatelessWidget {
//   const EquipmentItemWidget(
//       {Key? key, required this.name, required this.status, required this.id})
//       : super(key: key);
//   final String name;
//   final String status;
//   final String id;

//   final TextStyle titleStyle =
//       const TextStyle(color: Color(0xFF858B9C), fontSize: 13.3);
//   final TextStyle valueStyle =
//       const TextStyle(color: Color(0xFF111A34), fontSize: 13.3);
//   void onTap(BuildContext context) {
//     Navigator.pushNamed(context, '/equipment', arguments: {'name': name});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           onTap(context);
//         },
//         child: Container(
//           width: 375,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(9)),
//               color: Color(0xffffffff)),
//           margin: const EdgeInsets.only(bottom: 11.1),
//           child: Column(children: [
//             Container(
//                 padding: const EdgeInsets.only(
//                     top: 16.67, bottom: 13.33, left: 16.67, right: 16.67),
//                 decoration: const BoxDecoration(
//                     border: Border(
//                         bottom:
//                             BorderSide(width: 1, color: Color(0xFFE7E7E7)))),
//                 child: Flex(
//                   direction: Axis.horizontal,
//                   children: [
//                     Container(
//                         width: 18,
//                         height: 18,
//                         margin: const EdgeInsets.only(right: 8),
//                         child: MyImages.fireIcon),
//                     Expanded(
//                         child: Text(name,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF222A36),
//                                 fontSize: 18))),
//                     EquipmentStatusWidget(status: status)
//                   ],
//                 )),
//             Container(
//               margin: const EdgeInsets.only(top: 15.5),
//               padding: const EdgeInsets.only(
//                 left: 16.67,
//                 right: 16.67,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                       margin: const EdgeInsets.only(right: 8),
//                       child: Text('当前温度:', style: titleStyle)),
//                   Text('1600℃', style: valueStyle)
//                 ],
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 11.1),
//               padding: const EdgeInsets.only(
//                   left: 16.67, right: 16.67, bottom: 16.67),
//               child: Row(
//                 children: [
//                   Container(
//                       margin: const EdgeInsets.only(right: 8),
//                       child: Text('开机时长:', style: titleStyle)),
//                   Text(
//                     '2小时32分钟48秒',
//                     style: valueStyle,
//                   )
//                 ],
//               ),
//             )
//           ]),
//         ));
//   }
// }

// class EquipmentStatusWidget extends StatelessWidget {
//   const EquipmentStatusWidget({Key? key, required this.status})
//       : super(key: key);
//   final String status;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 43.3,
//         height: 20,
//         decoration: BoxDecoration(
//             color: getEquipmentStatusColor(status),
//             borderRadius: const BorderRadius.all(Radius.circular(10))),
//         child: Text(
//           getEquipmentStatusLabel(status),
//           textAlign: TextAlign.center,
//           style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 13),
//         ));
//   }
// }
