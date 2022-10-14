import 'package:flutter/material.dart';
import 'package:store/presentation/screens/sign_in/sign_in_screen.dart';
import 'profile_menu.dart';
import 'profile_picture.dart';


class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const ProfilePicture(),
          const SizedBox(height: 20,),
          ProfileMenu(
            text: "My Account",
            icon: const Icon(Icons.supervised_user_circle,),
            onPressed: (){}
          ),
          ProfileMenu(
            text: "Notifications",
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                    (Route<dynamic> route) => false,
              );
              // Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
