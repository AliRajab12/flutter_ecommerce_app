import 'package:flutter/material.dart';
import 'package:store/presentation/widgets/horizontal_timer.dart';

import 'otp_form.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Text(
              "OTP Verification",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.black,
                  letterSpacing: 2),
            ),
            const Text("We sent your code to +963 999 *** ***"),
            const HorizontalTimer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const OTPForm()
          ],
        ),
      ),
    );
  }
}
