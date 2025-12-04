import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/utils/context_extension.dart';

class LoginInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? errorText;

  const LoginInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: .w400,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: context.screenWidth / 2 - 64,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(
                    color: Colors.white10,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                fillColor: Colors.white10,
                filled: true,
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: .w300,
                  color: Colors.white38,
                ),
                errorText: (errorText == null || errorText!.isEmpty)
                    ? null
                    : errorText,
              ),
              controller: controller,
              obscureText: label == "Password",
              enableSuggestions: false,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
