import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/login_page/login_content.dart';

class LoginPanel extends StatelessWidget {
  const LoginPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF12233D),
            borderRadius: .circular(25),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 20),
            ],
            border: Border.all(color: Colors.white12),
          ),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 1.5,
          child: LoginContent(),
        ),
      ),
    );
  }
}
