import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';

class TopRoundedContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  const TopRoundedContainer({Key? key, required this.color, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.getProportionateScreenWidth(10)),
      padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40) ,
          topRight: Radius.circular(40)
        ),
      ),
      child: child,
    );
  }
}
