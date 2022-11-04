import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

final otpInputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 15),
    border: customOutlineInputBorder(borderRadius: 15, borderColor: textColor),
    focusedBorder:
        customOutlineInputBorder(borderRadius: 15, borderColor: textColor),
    enabledBorder:
        customOutlineInputBorder(borderRadius: 15, borderColor: textColor));

final searchFieldInputDecoration = InputDecoration(
    border: customOutlineInputBorder(
        borderColor: Colors.black45, borderRadius: 40, borderWidth: 2),
    focusedBorder: customOutlineInputBorder(
        borderColor: primaryColor, borderRadius: 40, borderWidth: 2),
    hintText: "Search",
    prefixIcon: Container(
      margin: const EdgeInsets.only(left: 20),
      child: SvgPicture.asset("assets/icons/search.svg"),
    ),
    prefixIconConstraints: const BoxConstraints(maxHeight: 45, maxWidth: 45),
    prefixText: "  ");

OutlineInputBorder customOutlineInputBorder(
    {Color? borderColor, double? borderRadius, double borderWidth = 1}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius!),
      borderSide: BorderSide(color: borderColor!, width: borderWidth));
}
