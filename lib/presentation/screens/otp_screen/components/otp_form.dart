import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/widgets/default_button.dart';
import 'package:store/presentation/widgets/form_input_style.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/presentation/screens/home/home_screen.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key}) : super(key: key);

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  late FocusNode pin2FocusNode,pin3FocusNode,pin4FocusNode;
  late TextEditingController pin1Controller,pin2Controller,pin3Controller,pin4Controller;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
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
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOTPField(controller:  pin1Controller,nextFocusNode: pin2FocusNode,autoFocus: true),
              buildOTPField(currentFocusNode: pin2FocusNode,controller:  pin2Controller,nextFocusNode: pin3FocusNode),
              buildOTPField(currentFocusNode: pin3FocusNode,controller:  pin3Controller,nextFocusNode: pin4FocusNode),
              buildOTPField(currentFocusNode: pin4FocusNode,controller:  pin4Controller,nextFocusNode: pin4FocusNode,lastNode: true),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            backgroundColor: primaryColor,
            forgroundColor: Colors.white,
            onPressed: () {
              String pin = pin1Controller.text + pin2Controller.text + pin3Controller.text + pin4Controller.text;
              if(pin == "1234"){
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  void moveFocus(FocusNode nextNode){
      nextNode.requestFocus();
  }
  void removeFocus(FocusNode currentNode){
    currentNode.unfocus();
  }
  Widget buildOTPField({FocusNode? currentFocusNode, required TextEditingController controller, required FocusNode nextFocusNode , bool autoFocus = false, bool lastNode = false} ){
    return SizedBox(
      width: SizeConfig.getProportionateScreenWidth(60),
      child: TextFormField(
        autofocus: autoFocus,
        focusNode: (currentFocusNode != null) ? currentFocusNode : null,
        controller: controller,
        obscureText: true,
        style: const TextStyle(fontSize: 24),
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: otpInputDecoration,
        onChanged: (value){
          if(lastNode){
            removeFocus(currentFocusNode!);
          }else{
            moveFocus(nextFocusNode);
          }

        },
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    pin1Controller.dispose();
    pin2Controller.dispose();
    pin3Controller.dispose();
    pin4Controller.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }
}
