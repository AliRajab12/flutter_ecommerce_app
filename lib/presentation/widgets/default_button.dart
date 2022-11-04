import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? forgroundColor;
  final double width, height;
  const DefaultButton(
      {Key? key,
      this.text,
      this.onPressed,
      this.backgroundColor = Colors.white,
      this.forgroundColor = primaryColor,
      this.width = 300,
      this.height = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // 300  60
        width: SizeConfig.getProportionateScreenWidth(width),
        height: SizeConfig.getProportionateScreenHeight(height),
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            foregroundColor: Colors.white,
            backgroundColor: backgroundColor,
          ),
          onPressed: onPressed,
          child: Text(
            text!,
            style: TextStyle(
              fontSize: SizeConfig.getProportionateScreenWidth(16),
              color: forgroundColor,
            ),
          ),
        ));
  }
}
