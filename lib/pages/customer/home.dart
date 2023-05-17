import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ruixing_app/routes/routes.dart';

class CustomerHomeWidget extends StatelessWidget {
  const CustomerHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Flex(
          direction: Axis.vertical,
          children: [
            const Text('customer'),
            ElevatedButton(
                onPressed: () {
                  context.replace(RoutesName.login);
                },
                child: const Text('退出登录'))
          ],
        ));
  }
}
