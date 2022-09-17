import 'package:flutter/material.dart';
import 'package:ruixing_app/common/theme.dart';
import '../components/login_top.dart';
import '../common/text.dart';

TextClass textInstance = TextClass();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /** 去掉appbar并防止溢出 */
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
            child: const SafeArea(top: true, child: Offstage())),
        // appBar: AppBar(
        //   title: const Text(''),
        // ),
        body: Container(
            alignment: Alignment.center,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const LoginTop(title: "您好", subtitle: "欢迎使用瑞星装车系统"),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Image.asset('lib/assets/images/start-page-img.jpg'),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 40),
                          primary: MainColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.pushNamed(context, "login");
                      },
                      child: Text(textInstance.login)),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(200, 40),
                          primary: MainColors.primary,
                          side: BorderSide(color: MainColors.primary),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () =>
                          {Navigator.pushNamed(context, "register")},
                      child: Text(textInstance.userRegister))
                ]),
              ),
            ])));
  }
}
