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
                      children: const [
                        WarningInfoItemWidget(),
                        WarningInfoItemWidget(),
                        WarningInfoItemWidget()
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ListView(
                    children: const [
                      Text('1'),
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
  const WarningInfoItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: 370,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: const [Text('窑炉设备#1')],
                  ))
            ],
          ),
        ));
  }
}
