import 'package:flutter/material.dart';
import 'package:ruixing_app/common/enum.dart';
import 'package:ruixing_app/pages/home/customer.dart';
import 'package:ruixing_app/pages/home/driver.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _current = RoleType.customer;
  @override
  void initState() {
    _current = RoleType.customer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _current == RoleType.customer
        ? const CustomerHomeWidget()
        : const DriverHomeWidget();
  }
}
