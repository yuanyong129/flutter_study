import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruixing_app/common/theme.dart';
import 'package:ruixing_app/routes/routes.dart';
import '../widgets/login_top.dart';
import 'package:ruixing_app/common/text.dart';

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
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(224, 238, 253, 1),
              Color.fromRGBO(245, 250, 255, 1)
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              foregroundColor: MainColors.colorFF111A34,
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const LoginTop(
                      title: "完善信息 成为司机",
                      subtitle: "欢迎你注册成为司机\n你的信息我们会严格保密，请放心填写"),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Form(
                          child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.w))),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '请输入司机姓名：',
                                      hintText: '请输入司机姓名'),
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
                                    })
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.w),
                            margin: EdgeInsets.only(top: 20.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.w))),
                            child: Column(children: [
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
                                  })
                            ]),
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text("上传驾驶证")),
                        ],
                      ))),
                  Container(
                      alignment: Alignment.center,
                      child: Column(children: [
                        ElevatedButton(
                            style: MainStyles.primaryButtonStyle,
                            onPressed: () {
                              _registerForm.print();
                            },
                            child: Text(TextClass.register)),
                        Padding(
                            padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
                            child: MaterialButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(
                                      context, RoutesName.login);
                                },
                                child: Text(TextClass.hadAccount,
                                    style: TextStyle(
                                        color: MainColors.colorFF666F83,
                                        fontSize: MainFontSize.fs28))))
                      ]))
                ]))));
  }
}
