import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/presentation/widgets/social_card.dart';

import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget{
  SignUpBody({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Text("Create An Account", style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
                letterSpacing: 2
            ),
            ),
            const Text(
              "Please enter your details or sign up \nwith your social media account",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            const SignUpForm(),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  iconPath: "assets/icons/google-icon.svg",
                  onTap: () {},
                ),
                SocialCard(
                  iconPath: "assets/icons/facebook-2.svg",
                  onTap: () {},
                ),
                SocialCard(
                  iconPath: "assets/icons/twitter.svg",
                  onTap: () {},
                ),

              ],
            ),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(20)),
            Text(
              'By continuing your confirm that you agree \nwith our Term and Condition',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(20)),
          ],
        ),
      ),
      ),

    );
  }
}