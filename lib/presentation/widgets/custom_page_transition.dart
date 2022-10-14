import 'package:flutter/material.dart';

class CustomScaleTransition extends PageRouteBuilder {
  final String nextPageUrl;
  final Widget nextPage;

  CustomScaleTransition({required this.nextPageUrl, required this.nextPage}) : super(
    settings: RouteSettings(name: nextPageUrl),
    pageBuilder: (context, animation, anotherAnimation) => nextPage,
    transitionDuration: const Duration(milliseconds: 1000),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return ScaleTransition(
        alignment: Alignment.bottomCenter,
        scale: animation,
        child: child,
      );
    },
  );
}

