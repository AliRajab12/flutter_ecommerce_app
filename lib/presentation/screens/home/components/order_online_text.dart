import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';

class OrderOnlineText extends StatelessWidget {
  const OrderOnlineText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(20),
        top: SizeConfig.getProportionateScreenWidth(15),
        bottom: SizeConfig.getProportionateScreenWidth(15)
      ),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(25),
          vertical: SizeConfig.getProportionateScreenHeight(15)),
      child: const Text(
        "Order online\ncollect in store",
        style: TextStyle(
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
