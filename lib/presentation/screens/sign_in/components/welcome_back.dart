import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getProportionateScreenHeight(250),
      child: Stack(
           children: [
               Container(
                  color: primaryColor,
                  ),
               Positioned(
                   top: 10,
                   left: SizeConfig.getProportionateScreenWidth(100),
                   child: Container(
                   width: SizeConfig.getProportionateScreenWidth(27),
                   height: SizeConfig.getProportionateScreenWidth(27),
                   decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         border: Border.all(color: const Color(0xff706dfc), width: 6, ),
                           ),
                        ),
                    ),
                Positioned(
                   top: -70,
                   right: SizeConfig.getProportionateScreenWidth(10),
                   child: Container(
                           width: SizeConfig.getProportionateScreenWidth(125),
                           height: SizeConfig.getProportionateScreenWidth(125),
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                                 border: Border.all(color: const Color(0xff706dfc), ),
                                 gradient: circleGradientColor
                               ),
                             ),
                           ),
               const Positioned.fill(
                     child: Align(
                     alignment: Alignment.center,
                         child: Text(
                             "Welcome\nBack",
                               style: TextStyle(
                               color: Colors.white,
                               fontSize: 55,
                               fontWeight: FontWeight.w800,
                            ),
                            )
                          ),
                       ),
                    Positioned(
                       bottom: 25,
                       right: SizeConfig.getProportionateScreenWidth(50),
                       child: Container(
                         width: SizeConfig.getProportionateScreenWidth(35),
                         height: SizeConfig.getProportionateScreenWidth(35),
                         decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(color: const Color(0xff706dfc), width: 6, ),
                         ),
                    ),
                 ),
                ],
            ),
    );
  }
}
