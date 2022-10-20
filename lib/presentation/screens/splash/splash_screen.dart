import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'components/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(body: SplashScreenBody());
  }
}
