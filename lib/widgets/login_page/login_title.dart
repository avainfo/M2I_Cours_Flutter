import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          "Login to your account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: .w600,
            color: Colors.white,
          ),
        ),
        Text(
          "Please enter your details to login",
          style: TextStyle(
            fontSize: 16,
            fontWeight: .w300,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}
