import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';

import 'components/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text("Sign With Us"),
      ),
      body: SignUpBody(),
    );
  }
}
