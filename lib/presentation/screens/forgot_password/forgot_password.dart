import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'components/forgot_pass_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text("Reset Password"),
      ),
      body: const ForgotScreenBody(),
    );
  }
}
