import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';

class HorizontalTimer extends StatelessWidget {
  const HorizontalTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will be expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: primaryColor),
          ),
        ),
      ],
    );
  }
}
