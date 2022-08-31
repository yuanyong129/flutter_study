import 'package:flutter/material.dart';
import 'package:baoquan_app/common/styles.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  void onPressed() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF8FAFD),
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: const Color(0xFF111A34),
          backgroundColor: const Color(0xFFFFFFFF),
          title: Text('温度控制', style: GlobalStyles.appbarTitleStyle),
          elevation: 2,
          actions: [TextButton(onPressed: onPressed, child: const Text('保存'))],
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(),
        )));
  }
}
