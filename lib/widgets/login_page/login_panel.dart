import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/utils/context_extension.dart';
import 'package:m2i_cours_flutter/widgets/login_page/login_content.dart';

class LoginPanel extends StatelessWidget {
  const LoginPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 8,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 4 -
                  35,
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF12233D),
                      borderRadius: .circular(25),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 20),
                      ],
                      border: Border.all(color: Colors.white12),
                    ),
                    width: context.screenWidth / 2,
                    child: LoginContent(login: true),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
