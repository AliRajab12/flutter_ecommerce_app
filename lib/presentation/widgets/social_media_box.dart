import 'package:flutter/material.dart';

import 'social_card.dart';

class SocialMediaBox extends StatelessWidget {
  const SocialMediaBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SocialCard(
              iconPath: "assets/icons/google.svg",
            ),
            SocialCard(
              iconPath: "assets/icons/facebook.svg",
            ),
            SocialCard(
              iconPath: "assets/icons/twitter.svg",
            ),
          ],
        ),
        Text(
          "By continue you are confirm that you agree\n with our terms and conditions",
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
