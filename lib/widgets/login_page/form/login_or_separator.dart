import 'package:flutter/material.dart';

class LoginOrSeparator extends StatelessWidget {
  const LoginOrSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .end,
      spacing: 16,
      children: [
        Expanded(
          child: Center(child: Divider(color: Colors.white24)),
        ),
        Center(
          child: Text(
            "or",
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w600,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Center(child: Divider(color: Colors.white24)),
        ),
      ],
    );
  }
}
