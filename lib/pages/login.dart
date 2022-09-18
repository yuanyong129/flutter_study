import 'package:flutter/material.dart';
import 'package:ruixing_app/common/theme.dart';
import 'package:ruixing_app/routes/routes.dart';
import 'package:ruixing_app/widgets/login_top.dart';
import 'package:ruixing_app/common/text.dart';
import 'package:ruixing_app/utils/http.dart';

HttpUtil httpUtil = HttpUtil();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Map<String, dynamic> _loginForm = {
    'username': '',
    'password': '',
    'code': 'g57c',
    'uuid': '23d148f9761d45608f244f3fc02588bc',
    'client_id': 'chambroad-pc',
    'client_secret': '123456',
    'overridden': true
  };

  // 密码是否展示
  bool _isPwd = true;

  void _changePwdShow() {
    setState(() {
      _isPwd = !_isPwd;
    });
  }

  void login() async {
    debugPrint(_loginForm.toString());
    try {
      Map<String, dynamic> response = await httpUtil.request('/auth/login',
          method: DioMethod.post, data: {}, params: _loginForm);
      debugPrint(response['data']['access_token']);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(TextClass.login),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          LoginTop(
              title: TextClass.hello, subtitle: TextClass.welcomeUseTheSystem),
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                          labelText: '请输入手机号：',
                          hintText: '请输入手机号',
                          prefixIcon: Icon(Icons.phone)),
                      onChanged: (String? username) {
                        _loginForm['username'] = username;
                      }),
                  TextFormField(
                      obscureText: _isPwd,
                      onChanged: (String? password) {
                        _loginForm['password'] = password;
                      },
                      decoration: InputDecoration(
                          labelText: '请输入密码：',
                          hintText: '请输入密码',
                          prefixIcon: const Icon(Icons.lock),
                          suffix: GestureDetector(
                            onTap: _changePwdShow,
                            child: Icon(_isPwd
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined),
                          )))
                ],
              ))),
          Container(
            alignment: Alignment.center,
            child: Column(children: [
              ElevatedButton(
                  style: MainStyles.primaryButtonStyle,
                  onPressed: () {
                    debugPrint(
                        "登录表单 手机号：${_loginForm['phonenumber']}，密码：${_loginForm['password']}");
                    login();
                  },
                  child: Text(TextClass.login)),
              MaterialButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, RoutesName.register)},
                  child: Text(TextClass.gotoRegister,
                      style: TextStyle(
                          color: MainColors.colorFF666F83,
                          fontSize: MainFontSize.fs28)))
            ]),
          ),
        ])));
  }
}
