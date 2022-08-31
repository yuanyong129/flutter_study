import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
          child: const SafeArea(top: true, child: Offstage())),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // direction: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: Image.asset('lib/assets/images/login-kazari.png'),
            ),
            const WelcomeWidgets(yDrift: -150.0),
            const LoginWidgets()
          ],
        ),
      ),
    );
  }
}

// 您好 欢迎组件
class WelcomeWidgets extends StatelessWidget {
  const WelcomeWidgets({Key? key, required this.yDrift}) : super(key: key);

  final double yDrift; // y偏移量

  @override
  Widget build(BuildContext context) {
    return Container(
        transform: Matrix4.translationValues(0.0, yDrift, 0.0),
        padding: const EdgeInsets.only(left: 15.5, right: 15.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '您好',
              style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 28,
                  height: 1.5,
                  fontWeight: FontWeight.bold),
            ),
            Text('欢迎登录宝泉生产管理系统',
                style: TextStyle(
                    fontSize: 14.0, height: 1.6, color: Color(0xff999ea6)))
          ],
        ));
  }
}

// 登录组件
class LoginWidgets extends StatefulWidget {
  const LoginWidgets({Key? key}) : super(key: key);

  @override
  State<LoginWidgets> createState() => _LoginWidgetsState();
}

class _LoginWidgetsState extends State<LoginWidgets> {
  final _formKey = GlobalKey<FormState>();

  // 密码是否展示
  bool _isPwd = true;

  bool _rememberPasswd = false;

  void _changePwdShow() {
    setState(() {
      _isPwd = !_isPwd;
    });
  }

  void login() {
    // if (_formKey.currentState!.validate()) {

    // }
    Navigator.popAndPushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        transform: Matrix4.translationValues(0.0, -120.0, 0.0),
        padding: const EdgeInsets.only(left: 15.5, right: 15.5),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: '手机号码',
                        hintText: '请输入手机号码',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入用户名';
                      }
                      return null;
                    },
                  ), // 手机号码框
                  TextFormField(
                    obscureText: _isPwd,
                    decoration: InputDecoration(
                        labelText: '登录密码',
                        hintText: '请输入登录密码',
                        prefixIcon: const Icon(Icons.lock),
                        suffix: GestureDetector(
                          onTap: _changePwdShow,
                          child: Icon(_isPwd
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入密码';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'IMEI号',
                        hintText: 'IMEI号',
                        prefixIcon: Icon(Icons.center_focus_strong_outlined)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请确认IMEI号';
                      }
                      return null;
                    },
                  )
                ])),
            Container(
              padding: const EdgeInsets.only(top: 17, bottom: 40.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                      value: _rememberPasswd,
                      onChanged: (_) {
                        setState(() {
                          _rememberPasswd = !_rememberPasswd;
                        });
                      }),
                  const Text('记住密码')
                ],
              ),
            ),
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(345, 48),
                  primary: const Color(0xff1D6FE9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: const Text('登录', style: TextStyle(fontSize: 20)),
            )
          ],
        ));
  }
}
