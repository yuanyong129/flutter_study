import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ruixing_app/common/enum.dart';
import 'package:ruixing_app/common/theme.dart';
import 'package:ruixing_app/routes/routes.dart';
import 'package:ruixing_app/widgets/list_item.dart';
import 'package:ruixing_app/widgets/login_top.dart';
import 'package:ruixing_app/common/text.dart';
import 'package:ruixing_app/widgets/toast.dart';

class RegisterForm {
  String? dirverName = ''; // 司机名称
  String? phoneNumber = ''; // 手机号
  String? cardNumber = ''; // 身份证号
  String? companyName = ''; // 所属公司
  String? carNo = ''; // 车牌号
  String? carType = ''; // 车型

  Map<String, String?> toMap() {
    var result = {
      'driverName': dirverName,
      'phoneNumber': phoneNumber,
      'cardNumber': cardNumber,
      'companyName': companyName,
      'carNo': carNo,
      'carType': carType
    };
    return result;
  }

  /// validate the register info
  bool validate(BuildContext context) {
    if (dirverName == null || dirverName!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(toast('请输入司机姓名', type: ToastType.warning));
      return false;
    }

    return true;
  }

  void print() {
    debugPrint(toString());
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
                                RegisterInputWidget(
                                  labelWidth: 270.w,
                                  title: '请输入司机姓名：',
                                  hintText: '请输入司机姓名',
                                  onChanged: (String? value) {
                                    _registerForm.dirverName = value;
                                  },
                                ),
                                RegisterInputWidget(
                                  labelWidth: 270.w,
                                  title: '请输入手机号：',
                                  hintText: '请输入手机号',
                                  onChanged: (String? value) {
                                    _registerForm.phoneNumber = value;
                                  },
                                ),
                                RegisterInputWidget(
                                  labelWidth: 270.w,
                                  title: '请输入身份证号：',
                                  hintText: '请输入身份证号',
                                  onChanged: (String? value) {
                                    _registerForm.cardNumber = value;
                                  },
                                ),
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
                              RegisterInputWidget(
                                labelWidth: 270.w,
                                title: '请输入所属公司：',
                                hintText: '请输入所属公司',
                                onChanged: (String? value) {
                                  _registerForm.companyName = value;
                                },
                              ),
                              RegisterInputWidget(
                                labelWidth: 270.w,
                                title: '请输入车牌号：',
                                hintText: '请输入车牌号',
                                onChanged: (String? value) {
                                  _registerForm.carNo = value;
                                },
                              ),
                              RegisterInputWidget(
                                labelWidth: 270.w,
                                title: '请输入车型：',
                                hintText: '请输入车型',
                                onChanged: (String? value) {
                                  _registerForm.carType = value;
                                },
                              ),
                              CommonListItem(
                                labelWidth: 270.w,
                                labelText: '请上传驾驶证：',
                                margin:
                                    EdgeInsets.only(top: 10.w, bottom: 20.w),
                                suffix: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text('上传驾驶证'),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: MainFontSize.fs28,
                                          )
                                        ],
                                      )),
                                ),
                              )
                            ]),
                          ),
                        ],
                      ))),
                  Container(
                      alignment: Alignment.center,
                      child: Column(children: [
                        ElevatedButton(
                            style: MainStyles.primaryButtonStyle,
                            onPressed: () {
                              _registerForm.validate(context);
                              debugPrint(_registerForm.toMap().toString());
                            },
                            child: Text(TextClass.register)),
                        Padding(
                            padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
                            child: MaterialButton(
                                onPressed: () {
                                  GoRouter.of(context)
                                      .replace(RoutesName.login);
                                },
                                child: Text(TextClass.hadAccount,
                                    style: TextStyle(
                                        color: MainColors.colorFF666F83,
                                        fontSize: MainFontSize.fs28))))
                      ]))
                ]))));
  }
}

class RegisterInputWidget extends StatelessWidget {
  const RegisterInputWidget(
      {Key? key,
      required this.title,
      this.margin,
      this.hintText,
      this.suffix,
      this.onChanged,
      this.labelWidth,
      this.obscureText = false})
      : super(key: key);
  final String? hintText;
  final String title;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? margin;
  final Widget? suffix;
  final bool obscureText;
  final double? labelWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      width: 690.w,
      height: 96.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30.w))),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Container(
              width: labelWidth,
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                title,
                style: CustomTextStyles.secondaryLabelStyle,
              )),
          Expanded(
              child: TextFormField(
            cursorColor: MainColors.primary,
            obscureText: obscureText,
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: suffix),
          ))
        ],
      ),
    );
  }
}
