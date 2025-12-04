import 'package:flutter/material.dart';

class LoginBottomLine extends StatelessWidget {
  final VoidCallback changeValue;
  final bool rememberMe;

  const LoginBottomLine({
    super.key,
    required this.changeValue,
    required this.rememberMe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisAlignment: .center,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: rememberMe,
            onChanged: (v) => changeValue(),
            fillColor: WidgetStatePropertyAll(Colors.white10),
            side: BorderSide(color: Colors.white12),
            hoverColor: Colors.white12,
            splashRadius: 0,
            shape: RoundedRectangleBorder(
              borderRadius: .circular(5),
            ),
          ),
        ),
        InkWell(
          onTap: () => changeValue(),
          child: Text(
            "Remember me",
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w300,
              color: Colors.white70,
            ),
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {},
          child: Text(
            "Forgot password?",
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
