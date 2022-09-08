import 'package:flutter/material.dart';
import '../components/login_top.dart';
import 'package:ruixing_app/common/text.dart';

TextClass textInstance = TextClass();

class RegisterForm {
  String? dirverName = ''; // 司机名称
  String? phoneNumber = ''; // 手机号
  String? cardNumber = ''; // 身份证号
  String? companyName = ''; // 所属公司
  String? carNo = ''; // 车牌号
  String? carType = ''; // 车型

  void print() {
    debugPrint('司机名称：$dirverName');
    debugPrint('手机号：$phoneNumber');
    debugPrint('身份证号：$cardNumber');
    debugPrint('所属公司：$companyName');
    debugPrint('车牌号：$carNo');
    debugPrint('车型：$carType');
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterForm _registerForm = RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(textInstance.userRegister),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const LoginTop(
              title: "完善信息 成为司机", subtitle: "欢迎你注册成为司机\n你的信息我们会严格保密，请放心填写"),
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '请输入司机姓名：',
                      hintText: '请输入司机姓名',
                    ),
                    onChanged: (String? value) {
                      _registerForm.dirverName = value;
                    },
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                        labelText: '请输入手机号：',
                        hintText: '请输入手机号',
                      ),
                      onChanged: (String? value) {
                        _registerForm.phoneNumber = value;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                        labelText: '请输入身份证号：',
                        hintText: '请输入身份证号',
                      ),
                      onChanged: (String? value) {
                        _registerForm.cardNumber = value;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                        labelText: '请输入所属公司：',
                        hintText: '请输入所属公司',
                      ),
                      onChanged: (String? value) {
                        _registerForm.companyName = value;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                        labelText: '请输入车牌号：',
                        hintText: '请输入车牌号',
                      ),
                      onChanged: (String? value) {
                        _registerForm.carNo = value;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                        labelText: '请输入车型：',
                        hintText: '请输入车型',
                      ),
                      onChanged: (String? value) {
                        _registerForm.carType = value;
                      }),
                  TextButton(onPressed: () {}, child: const Text("上传驾驶证")),
                ],
              ))),
          Container(
            alignment: Alignment.center,
            child: Column(children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    _registerForm.print();
                  },
                  child: Text(textInstance.register)),
            ]),
          ),
        ])));
  }
}
