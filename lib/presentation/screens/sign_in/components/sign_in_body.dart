import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/presentation/screens/sign_in/components/welcome_back.dart';
import 'sign_form.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: const [
           WelcomeBack(),
           SignForm()
    ]),
      )
    );
  }
}

