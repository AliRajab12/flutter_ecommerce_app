import 'package:flutter/material.dart';
import 'package:store/presentation/widgets/custom_header.dart';

import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Column(
            children: [
              const CustomHeader(
                title: "Forgot Password?",
                subTitle:
                    "Please enter your email and we will send\n you a link to reset your password",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    ));
  }
}
