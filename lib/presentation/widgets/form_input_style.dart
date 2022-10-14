import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';

final otpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: SizeConfig.getProportionateScreenWidth(15)),
    border: outlineInputBorder(),
    focusedBorder:outlineInputBorder(),
    enabledBorder: outlineInputBorder()
);


OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(SizeConfig.getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: textColor),
  );
}