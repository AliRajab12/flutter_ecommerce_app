import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:store/presentation/widgets/default_button.dart';
import 'package:store/presentation/widgets/custom_page_transition.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  _SplashScreenBodyState createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.ease  ,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: const BoxDecoration(
          gradient: primaryGradientColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Flexible(
              flex: 2,
              child: Text(
                    "Find your\nGadget",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w800,
                    ),
                  )
            ),
            Flexible(
              flex: 5,
                child: FadeTransition(
                  opacity: _animation,
                  child: Column(
                    children: [
                      Image.asset(
                          "assets/images/splash.png",
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.getProportionateScreenHeight(64),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff6350ff),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            DefaultButton(
              text: "Get Started",
              onPressed:(){ Navigator.push(context,
                  CustomScaleTransition(nextPageUrl: SignInScreen.routeName,
                      nextPage: const SignInScreen()));},
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
