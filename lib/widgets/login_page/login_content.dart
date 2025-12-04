import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/google_login_button.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/login_bottom_line.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/login_button.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/login_input.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/login_title.dart';
import 'package:m2i_cours_flutter/widgets/login_page/form/login_or_separator.dart';

class LoginContent extends StatefulWidget {
  final bool isLogin;

  const LoginContent({super.key, required this.isLogin});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final List<String> warningsCode = [
    'weak-password',
    'email-already-in-use',
    'invalid-email',
  ];
  bool checkBoxValue = false;
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
      padding: .symmetric(vertical: 24, horizontal: 32),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 32,
        children: [
          const LoginTitle(),
          const GoogleLoginButton(),
          const LoginOrSeparator(),
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
          if (!widget.isLogin)
            LoginInput(
              label: "Confirm Password",
              hint: "Confirm password",
              controller: confirmPasswordController,
            ),
          LoginBottomLine(
            changeValue: changeValue,
            checkBoxAction: checkBoxValue,
            login: widget.isLogin,
          ),
          LoginButton(
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            isLogin: widget.isLogin,
            checkBoxValue: checkBoxValue,
            warningsCode: warningsCode,
          ),
        ],
      ),
    );
  }

  void changeValue() {
    setState(() {
      checkBoxValue = !checkBoxValue;
    });
  }

  bool validateEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);
  }
}
