import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/Utilities/size_config.dart';


class CustomSuffixIcon extends StatelessWidget {
  final String svgIconPath;
  const CustomSuffixIcon({Key? key, required this.svgIconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.getProportionateScreenWidth(20),
          SizeConfig.getProportionateScreenWidth(20),
          0,
          SizeConfig.getProportionateScreenWidth(20)),
      child: SvgPicture.asset(
        svgIconPath,
        height: SizeConfig.getProportionateScreenWidth(18),
      ),
    );
  }
}
