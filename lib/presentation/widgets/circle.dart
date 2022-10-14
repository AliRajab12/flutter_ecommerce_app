import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';

class Circle extends StatelessWidget {
  final double width;
  final double height;
  final double borderWidth;
  final Color color;
  final Color borderColor;
  const Circle({Key? key, required this.width, required this.height,
    this.borderWidth = 0, this.color = Colors.transparent,
    this.borderColor  = const Color(0xff706dfc)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
          width: SizeConfig.getProportionateScreenWidth(width),
          height: SizeConfig.getProportionateScreenWidth(height),
          decoration: BoxDecoration(
          shape: BoxShape.circle,
           border: Border.all(color: borderColor, width: borderWidth, ),
            color: color
           ),
    );
  }
}
