import 'package:flutter/material.dart';
import 'package:store/presentation/widgets/circle.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/domain/entites/drawer_item.dart';
import 'package:store/presentation/screens/sign_in/sign_in_screen.dart';

import 'drawer_menu_item.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: ListView(
        children:
        [SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
          child: Stack(
            children: [
              Positioned(
                top: SizeConfig.getProportionateScreenHeight(100),
                right: SizeConfig.getProportionateScreenWidth(40),
                child:  Circle(
                  width: SizeConfig.getProportionateScreenWidth(27),
                  height: SizeConfig.getProportionateScreenHeight(27),
                  borderWidth: 6,
                )

              ),
              Positioned(
                top: SizeConfig.getProportionateScreenHeight(-50),
                right: SizeConfig.getProportionateScreenWidth(50),
                child:  Circle(
                  width: SizeConfig.getProportionateScreenWidth(125),
                  height: SizeConfig.getProportionateScreenHeight(125),
                  color: circleColor,
                )
              )
            ],
          ),
        ),
        // Second Container that contains drawer items and takes 30 percentage of the screen's height
        Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
              height: MediaQuery.of(context).size.height*0.4,
                child: Column(
                  children: drawerItems.map((drawerItem) =>  DrawerMenuItem(
                    title: drawerItem.title,
                    icon: drawerItem.icon,
                    lastItem: drawerItem.lastItem,
                    pageUrl: drawerItem.pageUrl,),
                  ).toList()
                ),
              ),
            ),
          ],
        ),
        // Third Container that contains two circles and one drawer item items and takes 20 percentage of the screen's height
        SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          child: Stack(
            children: [
              Positioned(
                left: SizeConfig.getProportionateScreenWidth(150),
                child:  Circle(
                  width: SizeConfig.getProportionateScreenWidth(27),
                  height: SizeConfig.getProportionateScreenHeight(27),
                  borderWidth: 6,
                )
              ),
              Positioned(
                top: SizeConfig.getProportionateScreenHeight(50),
                left: SizeConfig.getProportionateScreenWidth(30),
                child:  Circle(
                  width: SizeConfig.getProportionateScreenWidth(80),
                  height: SizeConfig.getProportionateScreenHeight(80),
                  color: circleColor,
                )
              ),
              Positioned.fill(
                top: SizeConfig.getProportionateScreenHeight(160),
                left: SizeConfig.getProportionateScreenWidth(5),
                child:  DrawerMenuItem(title: "Sign out",icon: Icons.logout,lastItem: true,pageUrl: SignInScreen.routeName,),
              ),
            ],
          ),
        ),
      ]),
    );
  }

}

