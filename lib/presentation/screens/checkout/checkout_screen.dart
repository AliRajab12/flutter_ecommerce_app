import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/presentation/widgets/custom_app_bar.dart';
import 'components/checkout_body.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = "/checkout";
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height + SizeConfig.getProportionateScreenHeight(40)),
          child: const CustomAppBar(title: "Checkout",)
      ),
      body: const CheckoutBody(),
    );
  }
}
