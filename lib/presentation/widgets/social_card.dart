import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/Utilities/size_config.dart';


class SocialCard extends StatelessWidget {
  final String? iconPath;
  final GestureTapCallback? onTap;

  const SocialCard({Key? key, required this.iconPath, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(12)),
        height: SizeConfig.getProportionateScreenHeight(40),
        width: SizeConfig.getProportionateScreenWidth(40),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(iconPath!),
      ),
    );
  }
}
