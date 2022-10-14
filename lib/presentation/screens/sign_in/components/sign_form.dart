import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/presentation/screens/forgot_password/forgot_password.dart';
import 'package:store/presentation/screens/home/home_screen.dart';
import 'package:store/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:store/presentation/widgets/custom_page_transition.dart';
import 'package:store/presentation/widgets/default_button.dart';
import 'package:store/presentation/widgets/form_errors.dart';
import 'package:store/Utilities/keyboard_util.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/Utilities/sqfilte_helper.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/form_messages.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final SqliteDbHelper _sqliteDbHelper = SqliteDbHelper();
  final _formKey = GlobalKey<FormState>();
  final _formEmailFieldKey = GlobalKey<FormFieldState>();
  final _formPasswordFieldKey = GlobalKey<FormFieldState>();
  String? email,password;
  late FocusNode passwordNode;
  final List<String?> errors= [];
  bool _obscureText = true;
  String  bTitle = "Show";

  @override
  void initState() {
    super.initState();
    passwordNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        )
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:  EdgeInsets.only(top: 25.0,left: 40,bottom: 30),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
      Form(
        key: _formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(
              width: SizeConfig.getProportionateScreenWidth(300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  emailFormField(),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(30),),
                  passwordFormField(),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(20),),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                            CustomScaleTransition(nextPageUrl: ForgotPasswordScreen.routeName,
                            nextPage: const ForgotPasswordScreen())),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: FormError(errors: errors),
            ),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(20),),
            DefaultButton(
              text: "Login",
              backgroundColor: primaryColor,
              forgroundColor: Colors.white,
              onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      // Check user Identity
                      bool result = await _sqliteDbHelper.checkIdentity(email: email,password: password);
                      if(result){
                        KeyboardUtil.hideKeyboard(context);
                        Navigator.push(context,
                            CustomScaleTransition(nextPageUrl: HomeScreen.routeName,
                                nextPage: const HomeScreen()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please check your email or password"),
                              backgroundColor: Colors.black38,
                            )
                        );
                      }
                    }
              },
            ),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(20),),
            GestureDetector(
              onTap: () => Navigator.push(context,
                          CustomScaleTransition(nextPageUrl: SignUpScreen.routeName,
                              nextPage: const SignUpScreen())),
              child: const Text(
                "Create an account?",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
        ],
      )
    );
  }


    TextFormField emailFormField(){
      return TextFormField(
        key: _formEmailFieldKey,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newEmail){
          setState(() {
            email = newEmail;
          });

        },
        onFieldSubmitted: (value){
          passwordNode.requestFocus();

        },
        onChanged: (newEmail){
          _formEmailFieldKey.currentState!.validate();
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
          labelText: "✉  Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      );
    }
  TextFormField passwordFormField(){
    return TextFormField(
      key: _formPasswordFieldKey,
      // Hide field contents
      focusNode: passwordNode,
      obscureText: _obscureText,

      onSaved: (newPassword){
        setState(() {
          password = newPassword;
        });
      },
      onChanged: (passwordText){
        _formPasswordFieldKey.currentState!.validate();
      },

      validator: (password){
        if(password!.isEmpty){
          return kPasswordNullError;
        }else if(password.length < 8){
          return kShortPasswordError;
        }
        return null;
      },
      decoration:  InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: TextButton(
            child: Text(bTitle,
              style: const TextStyle(
                color: primaryColor,
              ),),
            onPressed: (){
             setState(() {
               _obscureText = !_obscureText;
               bTitle = (bTitle == "Show") ? "Hide" : "Show";
             });
          },
        ),
      ),
    );
  }
  @override
  void dispose() {
    passwordNode.dispose();
    super.dispose();
  }
}
