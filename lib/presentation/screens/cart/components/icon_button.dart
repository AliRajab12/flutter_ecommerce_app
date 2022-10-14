import 'package:flutter/material.dart';

class CartIconButton extends StatelessWidget {

  final Color backgroundColor;
  final Icon icon;
  final GestureTapCallback? onTap;
  const CartIconButton({Key? key, required this.backgroundColor, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: icon,
      ),
    );
  }
}
