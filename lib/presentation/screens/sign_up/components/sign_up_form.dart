import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/widgets/custom_suffix_icon.dart';
import 'package:store/presentation/widgets/default_button.dart';
import 'package:store/presentation/widgets/form_errors.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/form_messages.dart';
import 'package:store/presentation/screens/complete_profile/complete_profile.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();
  final _formEmailFieldKey = GlobalKey<FormFieldState>();
  final _formPasswordFieldKey = GlobalKey<FormFieldState>();
  final _formconfirmPasswordFieldKey = GlobalKey<FormFieldState>();
  String? email,password,confirmPassword;
  late FocusNode passwordNode, confirmPasswordNode;
  @override
  void initState() {
    super.initState();
    passwordNode = FocusNode();
    confirmPasswordNode = FocusNode();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,),
        child: Column(
          children: [
            emailFormField(),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(30),),
            passwordFormField(),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(30),),
            confirmPasswordFormField(),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(40)),
            DefaultButton(
              text: "Continue",
              backgroundColor: primaryColor,
              forgroundColor: Colors.white,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName,
                      arguments: ScreenArgs(email: email!, password: password!));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  TextFormField emailFormField(){
    return TextFormField(
      key: _formEmailFieldKey,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newEmail){
        setState(() {
          email = newEmail;
        });
      },
      onFieldSubmitted: (newEmail){
        passwordNode.requestFocus();
      },
      onChanged: (newEmail){
        _formEmailFieldKey.currentState!.validate();
        email = newEmail;
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
  TextFormField passwordFormField(){
    return TextFormField(
      key: _formPasswordFieldKey,
      // Hide field contents
      obscureText: true,
      focusNode: passwordNode,
      onSaved: (newValue) => password = newValue,
      onChanged: (passwordText){
        _formPasswordFieldKey.currentState!.validate();
        password = passwordText;
      },

      onFieldSubmitted: (passwordText){
        confirmPasswordNode.requestFocus();
      },
      validator: (password){
        if(password!.isEmpty){
          return kPasswordNullError;
        }else if(password.length < 8){
          return kShortPasswordError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffixIcon(svgIconPath: "assets/icons/Lock.svg"),
      ),
    );
  }


  TextFormField confirmPasswordFormField(){
    return TextFormField(
      key: _formconfirmPasswordFieldKey,
      // Hide field contents
      obscureText: true,
      focusNode: confirmPasswordNode,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (passwordText){
        _formconfirmPasswordFieldKey.currentState!.validate();
        confirmPassword = passwordText;
      },
      validator: (passwordText){
        if(passwordText!.isEmpty){
          return kPasswordNullError;
        }else if(password != passwordText){
          return kPasswordMatchError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffixIcon(svgIconPath: "assets/icons/Lock.svg"),
      ),
    );
  }
@override
  void dispose() {
    passwordNode.dispose();
    confirmPasswordNode.dispose();
    super.dispose();
  }
}
class ScreenArgs{
  final String email;
  final String password;
  const ScreenArgs({required this.email, required this.password});
}