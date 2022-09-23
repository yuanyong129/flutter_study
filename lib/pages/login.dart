import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruixing_app/common/image.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 密码是否展示
  bool _isPwd = true;
  bool _isRememberPassword = false;

  void _changePwdShow() {
    setState(() {
      _isPwd = !_isPwd;
    });
  }

  void showToast() {}

  void login(BuildContext context) async {
    try {
      if (_loginForm['username'] == null || _loginForm['username'].isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('请输入手机号码')));
        return;
      }
      if (_loginForm['password'] == null || _loginForm['password'].isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('请输入密码')));
        return;
      }

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
        backgroundColor: const Color(0xFFF8FAFD),
        appBar: AppBar(
          foregroundColor: MainColors.colorFF111A34,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          LoginTop(
              title: TextClass.hello, subtitle: TextClass.welcomeUseTheSystem),
          Padding(
              padding: EdgeInsets.fromLTRB(30.w, 0.03.sh, 30.w, 0.05.sh),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginInputWidget(
                        title: '手机号码',
                        icon: MyImages.userIcon,
                        hintText: '请输入手机号码',
                        onChanged: (String? username) {
                          _loginForm['username'] = username;
                        },
                      ),
                      LoginInputWidget(
                          obscureText: _isPwd,
                          margin: EdgeInsets.only(top: 30.w, bottom: 10.w),
                          title: '登录密码',
                          icon: MyImages.passwordIcon,
                          hintText: '请输入登录密码',
                          onChanged: (String? password) {
                            _loginForm['password'] = password;
                          },
                          suffix: GestureDetector(
                            onTap: _changePwdShow,
                            child: Icon(
                                _isPwd
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                                color: MainColors.colorFFC5CAD5),
                          )),
                      Flex(
                          direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: _isRememberPassword,
                                onChanged: (e) {
                                  setState(() {
                                    _isRememberPassword = !_isRememberPassword;
                                  });
                                }),
                            const Text('记住密码'),
                            Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: const Text('忘记密码?'))))
                          ])
                    ],
                  ))),
          Container(
            alignment: Alignment.center,
            child: Column(children: [
              ElevatedButton(
                  style: MainStyles.primaryButtonStyle,
                  onPressed: () {
                    login(context);
                  },
                  child: Text(TextClass.login)),
              Container(
                margin: EdgeInsets.only(top: 0.01.sh),
                child: MaterialButton(
                    onPressed: () => {
                          Navigator.popAndPushNamed(
                              context, RoutesName.register)
                        },
                    child: Text(TextClass.gotoRegister,
                        style: TextStyle(
                            color: MainColors.colorFF666F83,
                            fontSize: MainFontSize.fs28))),
              )
            ]),
          ),
        ])));
  }
}

final loginLabelStyle = TextStyle(fontSize: 32.w);

class LoginInputWidget extends StatelessWidget {
  const LoginInputWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.margin,
      this.hintText,
      this.suffix,
      this.onChanged,
      this.obscureText = false})
      : super(key: key);
  final String? hintText;
  final Image icon;
  final String title;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? margin;
  final Widget? suffix;
  final bool obscureText;
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
          SizedBox(
            width: 74.w,
            height: 74.w,
            child: icon,
          ),
          Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Text(
                title,
                style: loginLabelStyle,
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
