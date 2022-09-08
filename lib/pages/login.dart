import 'package:flutter/material.dart';
import 'package:ruixing_app/components/login_top.dart';
import 'package:ruixing_app/common/text.dart';
import 'package:ruixing_app/utils/http.dart';

TextClass textInstance = TextClass();
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
          title: Text(textInstance.login),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const LoginTop(title: "您好", subtitle: "欢迎使用瑞星装车系统"),
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
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    debugPrint(
                        "登录表单 手机号：${_loginForm['phonenumber']}，密码：${_loginForm['password']}");
                    login();
                  },
                  child: Text(textInstance.login)),
              MaterialButton(
                  onPressed: () => {debugPrint('点击了注册')},
                  child: Text(textInstance.gotoRegister))
            ]),
          ),
        ])));
  }
}
