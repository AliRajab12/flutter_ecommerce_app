import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'forgot_pass_form.dart';

class ForgotScreenBody extends StatelessWidget {
  const ForgotScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04, ),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: SizeConfig.getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please enter your email and we will send \nyou a link to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              const ForgotPasswordForm(),
              ]),
          ),
        ),
    );
  }
}
