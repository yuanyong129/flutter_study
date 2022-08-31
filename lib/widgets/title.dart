import 'package:flutter/cupertino.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 3.33,
          height: 14.4,
          margin: const EdgeInsets.only(right: 7.78),
          decoration: const BoxDecoration(
              color: Color(0xFF1D6FE9),
              borderRadius: BorderRadius.all(Radius.circular(4.44))),
        ),
        Text(title,
            style: const TextStyle(
                color: Color(0xff111A34),
                fontSize: 16,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
