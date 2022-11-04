import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/presentation/screens/home/components/popular_product.dart';
import 'package:store/presentation/widgets/custom_bottom_navbar.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/enums.dart';
import 'components/categories.dart';
import '../../widgets/search_field.dart';
import 'components/special_offers.dart';
import 'components/text_banner.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late double xOffset, yOffset, scaleFactor;
  late bool isDrawerOpen;

  @override
  void initState() {
    super.initState();
    xOffset = yOffset = 0.0;
    scaleFactor = 1.0;
    isDrawerOpen = false;
  }

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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // Header component
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08),
              child: Row(
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0.0;
                              yOffset = 0.0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: SvgPicture.asset("assets/icons/hamburger.svg"),
                          onPressed: () {
                            setState(() {
                              xOffset =
                                  MediaQuery.of(context).size.width * 0.55;
                              yOffset =
                                  MediaQuery.of(context).size.height * 0.2;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Expanded(
                    // take the remaining space of the row
                    child: SearchField(),
                  )
                ],
              ),
            ),
            // Banner component
            const TextBanner(),
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
