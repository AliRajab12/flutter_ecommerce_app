import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/enums.dart';
import 'package:store/presentation/bloc/cart/cart_bloc.dart';
import 'package:store/presentation/bloc/cart/cart_event.dart';
import 'package:store/presentation/screens/cart/cart_screen.dart';
import 'package:store/presentation/screens/favourite/favourite_screen.dart';
import 'package:store/presentation/screens/home/home_screen.dart';
import 'package:store/presentation/screens/profile/profile_screen.dart';

import 'custom_page_transition.dart';

class CustomButtomNavBar extends StatelessWidget {
  final MenuState selectedMenu;
  const CustomButtomNavBar({Key? key, required this.selectedMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home_sharp,
                  color: MenuState.home == selectedMenu
                      ? primaryColor
                      : secondaryColor),
              onPressed: () {
                // Navigator.pushNamed(context, HomeScreen.routeName);
                Navigator.push(context,
                CustomScaleTransition(nextPageUrl: HomeScreen.routeName,
                    nextPage: const HomeScreen()));
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_outline_sharp,
                  color: MenuState.favourite == selectedMenu
                      ? primaryColor
                      : inActiveIconColor),
              onPressed: () => Navigator.push(context,
                     CustomScaleTransition(nextPageUrl: FavouriteScreen.routeName,
                     nextPage: const FavouriteScreen()))
              ,
            ),
            IconButton(
              icon: Icon(
                Icons.supervised_user_circle_outlined,
                color: MenuState.profile == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => Navigator.push(context,
                  CustomScaleTransition(nextPageUrl: ProfileScreen.routeName,
                      nextPage: const ProfileScreen()))
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: MenuState.cart == selectedMenu
                      ? primaryColor
                      : inActiveIconColor),
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(const FetchCartProductsEvent());
                Navigator.push(context,
                    CustomScaleTransition(nextPageUrl: CartScreen.routeName,
                        nextPage: const CartScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
