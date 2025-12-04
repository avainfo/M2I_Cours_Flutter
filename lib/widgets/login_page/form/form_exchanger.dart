import 'package:flutter/material.dart';

class FormExchanger extends StatelessWidget {
  final VoidCallback changeLoginState;
  final bool login;

  const FormExchanger({
    super.key,
    required this.changeLoginState,
    required this.login,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text(
          login ? "Don't have an account? " : "Already have an account? ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: .w300,
            color: Colors.white70,
          ),
        ),
        GestureDetector(
          onTap: () {
            changeLoginState();
          },
          child: Text(
            login ? "Create Now" : "Login Now",
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
