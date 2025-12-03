import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/login_page/google_login_button.dart';
import 'package:m2i_cours_flutter/widgets/login_page/login_bottom_line.dart';
import 'package:m2i_cours_flutter/widgets/login_page/login_input.dart';
import 'package:m2i_cours_flutter/widgets/login_page/login_title.dart';
import 'package:m2i_cours_flutter/widgets/login_page/or_separator.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;

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
          ),
          LoginInput(
            label: "Password",
            hint: "Enter your password",
            controller: passwordController,
          ),
          LoginBottomLine(changeValue: changeValue, rememberMe: rememberMe),
          SizedBox(
            height: 50,
            child: FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: .circular(15)),
                ),
              ),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
}
