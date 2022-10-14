import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/presentation/screens/home/components/popular_product.dart';
import 'package:store/presentation/widgets/custom_bottom_navbar.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/enums.dart';
import 'components/categories.dart';
import 'components/order_online_text.dart';
import 'components/search_field.dart';
import 'components/special_offers.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0.0)
          ..scale(scaleFactor),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            borderRadius: (isDrawerOpen)
                ? BorderRadius.circular(40)
                : BorderRadius.circular(0),
            color: Colors.white,
            boxShadow: [if (isDrawerOpen) drawerShadow]),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Home Page header component
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(40)),
              // Row contains three widgets Search Bar
              child: Row(
                children: [
                  // Search field that allows user to find a specific product
                  isDrawerOpen
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/hamburger.svg",
                            width: SizeConfig.getProportionateScreenWidth(20),
                            height: SizeConfig.getProportionateScreenHeight(20),
                          ),
                          onPressed: () {
                            setState(() {
                              xOffset =
                                  SizeConfig.getProportionateScreenHeight(230);
                              yOffset =
                                  SizeConfig.getProportionateScreenHeight(150);
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                  SizedBox(
                    width: SizeConfig.getProportionateScreenWidth(20),
                  ),
                  SearchField(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Discount banner component
            const OrderOnlineText(),
            // Categories component
            Categories(),
            // Special Offers component
            const SpecialOffers(),
            // Popular products component
            const PopularProducts(),

            const CustomButtomNavBar(selectedMenu: MenuState.home),
          ],
        ));
  }
}
