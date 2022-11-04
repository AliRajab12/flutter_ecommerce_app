import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/presentation/widgets/search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(40)),
      // Row contains three widgets Search Bar - Cart Icon - Num of Items
      child: Row(
        children: [
          // Search field that allows user to find a specific product or category
          IconButton(
              icon: SvgPicture.asset(
                "assets/icons/hamburger.svg",
                width: SizeConfig.getProportionateScreenWidth(20),
                height: SizeConfig.getProportionateScreenHeight(20),
              ),
              onPressed: () {}),
          SizedBox(
            width: SizeConfig.getProportionateScreenWidth(20),
          ),
          SearchField(),
        ],
      ),
    );
  }
}
