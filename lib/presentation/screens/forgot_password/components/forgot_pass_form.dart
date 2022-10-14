import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/widgets/custom_suffix_icon.dart';
import 'package:store/presentation/widgets/default_button.dart';
import 'package:store/presentation/widgets/form_errors.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/form_messages.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFormFieldKey = GlobalKey<FormFieldState>();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormField(),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            backgroundColor: primaryColor,
            forgroundColor: lightPrimaryColor,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          // NoAccountText(),
        ],
      ),
    );
  }
  TextFormField emailFormField(){
    return TextFormField(
      key: _emailFormFieldKey,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newEmail){
        setState(() {
          email = newEmail;
        });
      },
      onChanged: (newEmail){
        _emailFormFieldKey.currentState!.validate();
      },

      validator: (value) {
        if (value!.isEmpty) {

          return kEmailNullError;

        } else if (!emailValidatorRegExp.hasMatch(value)) {

          return kInvalidEmailError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon:  CustomSuffixIcon(svgIconPath: "assets/icons/Mail.svg"),
      ),
    );
  }
}
