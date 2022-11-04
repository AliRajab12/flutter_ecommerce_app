import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/form_field_styles.dart';
import 'package:store/presentation/widgets/custom_button.dart';
import 'package:store/presentation/screens/home/home_screen.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key}) : super(key: key);

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  late final TextEditingController pin1Controller,
      pin2Controller,
      pin3Controller,
      pin4Controller;

  @override
  void initState() {
    super.initState();
    pin1Controller = TextEditingController();
    pin2Controller = TextEditingController();
    pin3Controller = TextEditingController();
    pin4Controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOTPField(
                  firstNode: true, lastNode: false, controller: pin1Controller),
              buildOTPField(
                  firstNode: false,
                  lastNode: false,
                  controller: pin2Controller),
              buildOTPField(
                  firstNode: false,
                  lastNode: false,
                  controller: pin3Controller),
              buildOTPField(
                  firstNode: false, lastNode: true, controller: pin4Controller)
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.13, // 13% of the screen's height
          ),
          CustomButton(
            title: "Continue",
            backgroundColor: primaryColor,
            forgroundColor: Colors.white,
            onPressed: () {
              String pinCode = pin1Controller.text +
                  pin2Controller.text +
                  pin3Controller.text +
                  pin4Controller.text;
              if (pinCode == "1234") {
                // ScaffoldMessenger.of(context)
                //     .showSnackBar(SnackBar(content: Text(pinCode)));
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          TextButton(
            child: const Text(
              "Resend OTP code",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w200),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget buildOTPField(
      {required TextEditingController controller,
      bool firstNode = false,
      bool lastNode = false}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.16,
      child: TextFormField(
        autofocus: true,
        obscureText: true,
        controller: controller,
        style: const TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: otpInputDecoration,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty && lastNode == false) {
            // move forward
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && firstNode == false) {
            // return back
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    pin1Controller.dispose();
    pin2Controller.dispose();
    pin3Controller.dispose();
    pin4Controller.dispose();
    super.dispose();
  }
}
