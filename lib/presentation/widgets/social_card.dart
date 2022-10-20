import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/constants/colors.dart';

class SocialCard extends StatelessWidget {
  final String svgIconPath;
  const SocialCard({Key? key, required this.svgIconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.1,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: socialCardBgColor,
      ),
      child: SvgPicture.asset(svgIconPath),
    );
  }
}
