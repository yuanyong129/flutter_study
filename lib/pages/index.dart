import 'package:flutter/material.dart';
import 'package:ruixing_app/common/enum.dart';
import 'package:ruixing_app/pages/customer/home.dart';
import 'package:ruixing_app/pages/driver/home.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
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
