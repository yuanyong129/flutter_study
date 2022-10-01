import 'package:baoquan_app/common/index.dart';
import 'package:baoquan_app/common/theme.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: MyImages.loginBg.image)),
          child: Flex(
            direction: Axis.vertical,
            children: const [
              Expanded(child: LoginFormWidget()),
              LoginFooterWidget()
            ],
          )),
    );
  }
}

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 800,
          height: 400,
          decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: MyImages.loginCardLeft,
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: Text('right'),
                ),
              ),
            ],
          )),
    );
  }
}

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1.sw,
        height: 34,
        child: Center(
          child: Text(
            'LikeAdmin开源系统',
            style: TextStyle(
                color: TextColors.secondaryColor,
                fontSize: TextFontSize.extraSmall),
          ),
        ));
  }
}
