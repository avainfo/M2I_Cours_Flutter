import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/google_login_button.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/login_bottom_line.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/login_input.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/login_title.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/or_separator.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/signin_button.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final List<String> warningsCode = [
    'weak-password',
    'email-already-in-use',
    'invalid-email',
  ];
  bool rememberMe = false;
  String? emailErrorText;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      if (!validateEmail(emailController.text) &&
          emailErrorText != "Invalid email") {
        setState(() {
          emailErrorText = "Invalid email";
        });
      } else if (validateEmail(emailController.text) &&
          emailErrorText != null) {
        setState(() {
          emailErrorText = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(vertical: 32, horizontal: 32),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 32,
        children: [
          const LoginTitle(),
          const GoogleLoginButton(),
          const OrSeparator(),
          LoginInput(
            label: "Email",
            hint: "Enter email address",
            controller: emailController,
            errorText: emailErrorText,
          ),
          LoginInput(
            label: "Password",
            hint: "Enter your password",
            controller: passwordController,
          ),
          LoginBottomLine(changeValue: changeValue, rememberMe: rememberMe),
          SignInButton(
            emailController: emailController,
            passwordController: passwordController,
            warningsCode: warningsCode,
          ),
        ],
      ),
    );
  }

  void changeValue() {
    setState(() {
      rememberMe = !rememberMe;
    });
  }

  bool validateEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);
  }
}
