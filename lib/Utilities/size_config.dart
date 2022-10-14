import 'package:flutter/material.dart';

class SizeConfig{
  // Object represent MediaQuery data of specific context
  static late MediaQueryData _mediaQueryData;
  // static variable represents screen's width
  static late double screenWidth;
  // static variable represents screen's height
  static late double screenHeight;
  // static variable represents screen's default size
  static double? defaultSize;
  // static variable represents screen's orientation
  static late Orientation orientation;

  static void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
// Get the proportionate height as per screen size
  static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = SizeConfig.screenHeight;
    // 812 is the layout height that designer use
    return (inputHeight / 812) * screenHeight;
  }

// Get the proportionate height as per screen size
  static double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = SizeConfig.screenWidth;
    // 375 is the layout width that designer use
    return (inputWidth / 375) * screenWidth;
  }
}