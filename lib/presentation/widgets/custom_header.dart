import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title, subTitle;
  const CustomHeader({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.08,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 2),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(subTitle, textAlign: TextAlign.center),
      ],
    );
  }
}
