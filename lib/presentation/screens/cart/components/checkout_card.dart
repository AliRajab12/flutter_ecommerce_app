import 'package:flutter/material.dart';

import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/widgets/default_button.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getProportionateScreenWidth(15),
        vertical:SizeConfig.getProportionateScreenWidth(30)
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
    ),
        boxShadow:  [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
    ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  height: SizeConfig.getProportionateScreenWidth(40),
                  width: SizeConfig.getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.receipt),
                ),
                const Spacer(),
                const Text("Add voucher code"),
                const SizedBox(width: 8,),
                const Icon(
                  Icons.arrow_forward_ios,size: 12,color: textColor,
                ),
                SizedBox(height: SizeConfig.getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            text: "\$337.15",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: SizeConfig.getProportionateScreenWidth(100),
                      child: DefaultButton(
                        text: "Checkout",
                        onPressed: (){},
                      )
                    ),
              ],
            )
          ],
        ),
      ]),
    )
    );
  }
}
