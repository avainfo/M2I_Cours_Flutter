import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.warningsCode,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final List<String> warningsCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FilledButton(
        onPressed: () async {
          print("test");
          try {
            final credential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
            print("Credential : $credential");
          } on FirebaseAuthException catch (e) {
            toastification.show(
              closeOnClick: true,
              alignment: .bottomRight,
              icon: Icon(
                warningsCode.contains(e.code)
                    ? Icons.warning_amber_rounded
                    : Icons.error_outline_rounded,
              ),
              style: .flatColored,
              type: warningsCode.contains(e.code) ? .warning : .error,
              title: Text(
                warningsCode.contains(e.code) ? "Warning" : "Error",
              ),
              description: Text(e.message ?? "Error"),
              showProgressBar: true,
              autoCloseDuration: Duration(seconds: 3),
            );
          } catch (e) {
            toastification.show(
              style: .flatColored,
              type: .error,
              title: Text("Error"),
              description: Text("Error on login"),
              showProgressBar: true,
              autoCloseDuration: Duration(seconds: 3),
            );
          }
        },
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
    );
  }
}
