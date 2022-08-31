import 'package:flutter/material.dart';
import 'package:baoquan_app/common/index.dart';
import 'package:baoquan_app/pages/options.dart';
import 'package:baoquan_app/pages/mine.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    OptionsPage(),
    MinePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  // void initState() {
  //   super.initState();
  //   debugPrint('didChangeDependencies');
  //   String token = '';
  //   if (token.isEmpty || token == '') {
  //     Future.delayed(const Duration(milliseconds: 100)).then((_) {
  //       Navigator.pushReplacementNamed(context, 'login');
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              label: '设定',
              icon: SizedBox(
                  width: 21.5, height: 19, child: MyImages.optionsInactiveIcon),
              activeIcon: SizedBox(
                  width: 21.5, height: 19, child: MyImages.optionsActiveIcon)),
          BottomNavigationBarItem(
              label: '个人中心',
              icon: SizedBox(
                  width: 21.5, height: 19, child: MyImages.mineInavticeIcon),
              activeIcon: SizedBox(
                  width: 21.5, height: 19, child: MyImages.mineAvticeIcon))
        ],
      ),
    );
  }
}
