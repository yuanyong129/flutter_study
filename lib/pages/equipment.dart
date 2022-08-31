import 'package:baoquan_app/common/index.dart';
import 'package:baoquan_app/common/styles.dart';
import 'package:baoquan_app/routes/index.dart';
import 'package:baoquan_app/utils/index.dart';
import 'package:flutter/material.dart';

TextStyle titleStyle = const TextStyle(
    color: Color(0xFF111A34), fontSize: 18, fontWeight: FontWeight.bold);

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({Key? key}) : super(key: key);

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  void _onUpdate() {
    debugPrint('update');
  }

  @override
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
        backgroundColor: const Color(0xFFf8fafd),
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: const Color(0xFF111A34),
          backgroundColor: const Color(0xFFf8fafd),
          title: Text(obj['name'], style: GlobalStyles.appbarTitleStyle),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Container(
                  margin: const EdgeInsets.only(top: 22, bottom: 22),
                  width: 180,
                  height: 203,
                  child: MyImages.equipmentImage),
              Container(
                  width: 370,
                  padding: const EdgeInsets.only(top: 10, left: 17, right: 17),
                  decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Column(
                    children: [
                      TitleAreaWidget(
                        onUpdate: _onUpdate,
                        updateTime: '2022/08/08 15:43:57',
                      ),
                      const LineWidget(),
                      RecordItemWidget(
                          icon: MyImages.recordTemperature,
                          label: '当前温度',
                          content: RecordContentWidget(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.temperature);
                              },
                              contentText: '1600℃',
                              contentColor: const Color(0xFF5878B4),
                              defaultContent: false)),
                      const LineWidget(),
                      RecordItemWidget(
                          icon: MyImages.recordTemperature,
                          label: '当前功率',
                          content:
                              const RecordContentWidget(contentText: '1369kw')),
                      const LineWidget(),
                      RecordItemWidget(
                          icon: MyImages.recordTemperature,
                          label: '当日用电',
                          content: const RecordContentWidget(
                              contentText: '4586kw/h')),
                      const LineWidget(),
                      RecordItemWidget(
                          icon: MyImages.recordTemperature,
                          label: '告警信息',
                          content: RecordContentWidget(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.warningInfo);
                              },
                              contentText: '0 条',
                              contentColor: const Color(0xFF5878B4),
                              defaultContent: false)),
                    ],
                  )),
              const EquipmentStatusWidget(status: EquipmentStatus.running)
            ]))));
  }
}

/// 数据记录标题组件
class TitleAreaWidget extends StatelessWidget {
  const TitleAreaWidget({Key? key, this.onUpdate, required this.updateTime})
      : super(key: key);
  final String updateTime;
  final void Function()? onUpdate;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('数据记录', style: titleStyle),
          Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 16),
              child: Text('更新时间: $updateTime',
                  style:
                      const TextStyle(color: Color(0xFF858B9C), fontSize: 13)))
        ])),
        ElevatedButton(
            onPressed: onUpdate,
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(56, 30),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(11))),
                primary: const Color(0xFF1D6FE9)),
            child: const Text('更新', style: TextStyle(fontSize: 15)))
      ],
    );
  }
}

/// 数据记录组件
class RecordItemWidget extends StatelessWidget {
  const RecordItemWidget(
      {Key? key,
      required this.icon,
      required this.label,
      required this.content})
      : super(key: key);
  final Image icon;
  final String label;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(right: 10),
              child: icon),
          Expanded(
              child: Text(label,
                  style:
                      const TextStyle(color: Color(0xFF111A34), fontSize: 18))),
          content
        ],
      ),
    );
  }
}

/// 数据记录内容组件
class RecordContentWidget extends StatelessWidget {
  const RecordContentWidget(
      {Key? key,
      required this.contentText,
      this.defaultContent = true,
      this.contentColor = const Color(0xFF858B9C),
      this.onPressed})
      : super(key: key);
  final bool defaultContent;
  final String contentText;
  final Color contentColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return defaultContent
        ? Text(contentText, style: TextStyle(color: contentColor))
        : GestureDetector(
            onTap: onPressed,
            child: Row(children: [
              Text(contentText, style: TextStyle(color: contentColor)),
              Icon(Icons.keyboard_arrow_right_sharp, color: contentColor)
            ]));
  }
}

/// 设备状态组件
class EquipmentStatusWidget extends StatelessWidget {
  const EquipmentStatusWidget({Key? key, required this.status})
      : super(key: key);
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.all(16),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: Text('设备状态', style: titleStyle)),
          Text(getEquipmentStatusLabel(status),
              style: TextStyle(
                  color: getEquipmentStatusColor(status), fontSize: 15))
        ],
      ),
    );
  }
}

/// 下划线组件
class LineWidget extends StatelessWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.12)),
    );
  }
}
