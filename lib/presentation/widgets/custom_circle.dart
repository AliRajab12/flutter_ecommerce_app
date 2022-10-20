import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';

class CustomCircle extends StatelessWidget {
  final double width, height;
  final double borderWidth;
  final Color? color;
  final LinearGradient? gradient;
  const CustomCircle(
      {Key? key,
      required this.width,
      required this.height,
      this.color = Colors.transparent,
      this.gradient,
      this.borderWidth = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            gradient: gradient,
            border: Border.all(color: circleColor, width: borderWidth)));
  }
}
