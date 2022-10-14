import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';


class IconCounterButton extends StatelessWidget {
  final String iconPath;
  final int numberOfItems;
  final GestureTapCallback onPressed;
  const IconCounterButton({Key? key,required this.iconPath,required this.onPressed,this.numberOfItems = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(12)),
            height: SizeConfig.getProportionateScreenWidth(46),
            width: SizeConfig.getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.1),
              shape: BoxShape.circle
            ),
            child: SvgPicture.asset(iconPath),
          ),
          if(numberOfItems !=0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: SizeConfig.getProportionateScreenWidth(16),
                width: SizeConfig.getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Text(
                  "$numberOfItems",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(10),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
