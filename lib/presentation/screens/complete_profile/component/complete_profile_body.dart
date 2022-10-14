import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/presentation/screens/sign_up/components/sign_up_form.dart';

import 'complete_profile_form.dart';

class CompleteProfileBody extends StatelessWidget {
   late ScreenArgs userData;
   CompleteProfileBody({Key? key,required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userName = userData.email.split("@")[0];
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Complete $userName Profile",style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2
                ),
                ),
                const Text(
                  "Please complete your information",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(userData: userData),
                SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
              ],
            )
          ),
        ),
      ),
    );
  }
}
