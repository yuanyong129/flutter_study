import 'package:baoquan_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:baoquan_app/common/styles.dart';

class WarningInfoPage extends StatefulWidget {
  const WarningInfoPage({Key? key}) : super(key: key);

  @override
  State<WarningInfoPage> createState() => _WarningInfoPageState();
}

class _WarningInfoPageState extends State<WarningInfoPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchBarController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          foregroundColor: const Color(0xFF111A34),
          backgroundColor: const Color(0xFFFFFFFF),
          title: Text('告警信息', style: GlobalStyles.appbarTitleStyle)),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextField(
                    controller: _searchBarController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _searchText.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  _searchBarController.clear();
                                  setState(() {
                                    _searchText = '';
                                  });
                                },
                                child: const Icon(Icons.close_rounded))
                            : null,
                        hintText: '请输入关键词搜索',
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 8.0),
                        filled: true,
                        fillColor: const Color(0xFFF3F4F5),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide.none)),
                    onChanged: (value) => setState(() {
                      _searchText = value;
                    }),
                    onSubmitted: (value) {
                      debugPrint(value);
                    },
                  ),
                ),
                TabBar(
                    indicatorColor: const Color(0xFF1D6FE9),
                    indicatorPadding:
                        const EdgeInsets.only(left: 60, right: 60),
                    unselectedLabelColor: const Color(0xFF666F83),
                    labelColor: const Color(0xFF1D6FE9),
                    controller: _tabController,
                    tabs: const [Tab(child: Text('正在告警')), Tab(text: '历史告警')]),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: TabBarView(controller: _tabController, children: [
                Container(
                    decoration: const BoxDecoration(),
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 20),
                      children: [
                        WarningInfoItemWidget(icon: MyImages.fireCircleIcon),
                        WarningInfoItemWidget(icon: MyImages.fireCircleIcon),
                        WarningInfoItemWidget(icon: MyImages.fireCircleIcon)
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ListView(
                    children: [
                      WarningInfoItemWidget(icon: MyImages.fireIcon),
                      WarningInfoItemWidget(icon: MyImages.fireIcon),
                      WarningInfoItemWidget(icon: MyImages.fireIcon)
                    ],
                  ),
                )
              ]))
        ],
      ),
    );
  }
}

class WarningInfoItemWidget extends StatelessWidget {
  const WarningInfoItemWidget({Key? key, required this.icon}) : super(key: key);
  final Image icon;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 6),
          width: 370,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(right: 8),
                          child: icon),
                      const Expanded(
                          child: Text('窑炉设备#1',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF111A34)))),
                      const KilnStatusWidget()
                    ],
                  )),
              Container(
                  height: 1,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.12))),
              Stack(
                children: [
                  Column(
                    children: const [
                      KilnContentWidget(
                          label: '告警内容：', content: '设备温度达到上限，请注意！'),
                      KilnContentWidget(
                          label: '告警时间：', content: '2022-8-9  12:00'),
                      KilnContentWidget(label: '告警来源：', content: 'PL告警'),
                      KilnContentWidget(label: '告警状态：', content: '告警中')
                    ],
                  ),
                  Positioned(
                      right: 0,
                      bottom: 5,
                      child: Row(
                        children: [
                          OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFFFFF),
                                  elevation: 1,
                                  side: const BorderSide(
                                      color: Color(0xFF1D6FE9)),
                                  primary: const Color(0xFF1D6FE9)),
                              child: const Text('数据')),
                          Container(
                              margin: const EdgeInsets.only(left: 8),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 1,
                                      primary: const Color(0xFF1D6FE9)),
                                  onPressed: () {},
                                  child: const Text('处置')))
                        ],
                      ))
                ],
              )
            ],
          ),
        ));
  }
}

class KilnContentWidget extends StatelessWidget {
  const KilnContentWidget(
      {Key? key, required this.label, required this.content})
      : super(key: key);
  final String label;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [Text(label), Text(content)],
      ),
    );
  }
}

/// 窑炉状态widget
class KilnStatusWidget extends StatelessWidget {
  const KilnStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 44,
        height: 20,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: const Color(0xFFFF5B60), width: 1.2)),
        child: const Text('危急',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13, height: 1.3, color: Color(0xFFFF5B60))));
  }
}
