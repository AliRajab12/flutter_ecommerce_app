import 'package:flutter/material.dart';
import 'package:store/presentation/widgets/custom_header.dart';
import 'package:store/presentation/widgets/social_media_box.dart';

import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          children: [
            const CustomHeader(
              title: "Create an account",
              subTitle:
                  "Please enter your details or sign up\n with your social media account",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const SignUpForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const SocialMediaBox()
          ],
        ),
      ),
    );
  }
}
