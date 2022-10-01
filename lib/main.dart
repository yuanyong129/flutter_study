import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baoquan_app/routes/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(960.0, 540.0),
        builder: (context, child) {
          return FluentApp(
            title: '后台管理系统',
            initialRoute: Routes.login,
            debugShowCheckedModeBanner: false,
            routes: routes,
          );
        });
  }
}
