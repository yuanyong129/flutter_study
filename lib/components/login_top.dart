import 'package:flutter/material.dart';

class LoginTop extends StatelessWidget {
  const LoginTop({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20),
        alignment: Alignment.topLeft,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: 170,
            height: 50,
            child: Image.asset('lib/assets/images/logo.png'),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold))),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ]));
  }
}
