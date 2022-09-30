import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruixing_app/common/theme.dart';
import 'package:ruixing_app/routes/routes.dart';
import '../widgets/login_top.dart';
import '../common/text.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  // final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        /** 去掉appbar并防止溢出 */
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
            child: const SafeArea(top: true, child: Offstage())),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          LoginTop(
              title: TextClass.hello, subtitle: TextClass.welcomeUseTheSystem),
          Container(
            width: 1.sw,
            margin: EdgeInsets.only(top: 0.02.sh, bottom: 0.02.sh),
            child: Image.asset('lib/assets/images/start-page-img.jpg'),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(children: [
              /// the login button
              ElevatedButton(
                  style: MainStyles.primaryButtonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Text(TextClass.login)),

              /// the register button
              Container(
                margin: EdgeInsets.only(top: 0.02.sh),
                child: OutlinedButton(
                    style: MainStyles.primaryOutlinedButtonStyle,
                    onPressed: () =>
                        {Navigator.pushNamed(context, RoutesName.register)},
                    child: Text(TextClass.userRegister)),
              )
            ]),
          ),
        ])));
  }
}
