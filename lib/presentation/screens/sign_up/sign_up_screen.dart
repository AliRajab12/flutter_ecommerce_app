import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';

import 'components/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "/signUp";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign With Us"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: const SignUpBody(),
    );
  }
}
