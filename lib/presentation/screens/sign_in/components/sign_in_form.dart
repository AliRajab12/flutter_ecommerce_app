import 'package:flutter/material.dart';
import 'package:store/Utilities/keyboard_util.dart';
import 'package:store/Utilities/sqfilte_helper.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/form_messages.dart';
import 'package:store/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:store/presentation/screens/home/home_screen.dart';
import 'package:store/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:store/presentation/widgets/custom_button.dart';
import 'package:store/presentation/widgets/custom_page_transition.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final SqliteDbHelper _sqliteDbHelper = SqliteDbHelper();
  final _formKey = GlobalKey<FormState>();
  final _emailFormFieldKey = GlobalKey<FormFieldState>();
  final _passwordFormFieldKey = GlobalKey<FormFieldState>();
  String? email, password;
  late FocusNode passwordFocusNode;
  String paswordFieldSuffixText = "Show";
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text("Login",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                emailFormField(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                passwordFormField(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        CustomScaleTransition(
                            nextPageUrl: ForgotPasswordScreen.routeName,
                            nextPage: const ForgotPasswordScreen())),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: primaryColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomButton(
                  title: "Login",
                  backgroundColor: primaryColor,
                  forgroundColor: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.85,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Check user Identity
                      bool result = await _sqliteDbHelper.checkIdentity(
                          email: email, password: password);
                      if (result) {
                        KeyboardUtil.hideKeyboard(context);
                        Navigator.push(
                            context,
                            CustomScaleTransition(
                                nextPageUrl: HomeScreen.routeName,
                                nextPage: const HomeScreen()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Please check your email or password"),
                          backgroundColor: Colors.black38,
                        ));
                      }
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CustomScaleTransition(
                          nextPageUrl: SignUpScreen.routeName,
                          nextPage: const SignUpScreen())),
                  child: const Text(
                    "Create an account?",
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      key: _emailFormFieldKey,
      onSaved: (newEmail) {
        setState(() {
          email = newEmail;
        });
      },
      onChanged: (newEmail) {
        _emailFormFieldKey.currentState!
            .validate(); // call emailFormField validator
      },
      onFieldSubmitted: (newEmail) {
        passwordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Email", hintText: "Enter your email"),
      validator: (newEmail) {
        if (newEmail!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(newEmail)) {
          return kInvalidEmailError;
        }
        return null;
      },
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      key: _passwordFormFieldKey,
      focusNode: passwordFocusNode,
      onSaved: (newPassword) {
        setState(() {
          password = newPassword;
        });
      },
      onChanged: (newPassword) {
        _passwordFormFieldKey.currentState!
            .validate(); // call passowrd field validator
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: TextButton(
            child: Text(
              paswordFieldSuffixText,
              style: const TextStyle(color: primaryColor),
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
                paswordFieldSuffixText =
                    (paswordFieldSuffixText == "Show") ? "Hide" : "Show";
              });
            },
          )),
      validator: (newPassword) {
        if (newPassword!.isEmpty) {
          return kPasswordNullError;
        } else if (newPassword.length < 8) {
          return kShortPasswordError;
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }
}

class ScreenArgs {
  final String email;
  final String password;
  const ScreenArgs({required this.email, required this.password});
}
