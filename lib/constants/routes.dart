import 'package:flutter/material.dart';
import 'package:store/presentation/screens/cart/cart_screen.dart';
import 'package:store/presentation/screens/checkout/checkout_screen.dart';
import 'package:store/presentation/screens/complete_profile/complete_profile.dart';
import 'package:store/presentation/screens/favourite/favourite_screen.dart';
import 'package:store/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:store/presentation/screens/home/home_screen.dart';
import 'package:store/presentation/screens/orders/orders_screen.dart';
import 'package:store/presentation/screens/otp_screen/otp_screen.dart';
import 'package:store/presentation/screens/product_details/product_details_screen.dart';
import 'package:store/presentation/screens/profile/profile_screen.dart';
import 'package:store/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:store/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:store/presentation/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OTPScreen.routeName: (context) => const OTPScreen(),
  CheckoutScreen.routeName: (context) => const CheckoutScreen(),
  FavouriteScreen.routeName: (context) => const FavouriteScreen(),
  OrderScreen.routeName: (context) => const OrderScreen()
};
