import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m2i_cours_flutter/data/providers/status_provider.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isLogin;
  final bool checkBoxValue;
  final List<String> warningsCode;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isLogin,
    required this.checkBoxValue,
    required this.warningsCode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FilledButton(
        onPressed: () async {
          if (isLogin) {
            await login(context);
          } else {
            await signIn(context);
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
            isLogin ? "Login" : "Create Account",
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

  Future<void> login(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (kDebugMode) {
        print("Credential : $credential");
      }
    } on FirebaseAuthException catch (e) {
      showLoggingToast(e);
      return;
    } catch (e) {
      toastification.show(
        style: .flatColored,
        type: .error,
        title: Text("Error"),
        description: Text("Error on login"),
        showProgressBar: true,
        autoCloseDuration: Duration(seconds: 3),
      );
      return;
    }
    context.read<StatusProvider>().login(checkBoxValue);
    if (context.mounted) context.go('/');
  }

  Future<void> signIn(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      toastification.show(
        style: .flatColored,
        type: .error,
        title: Text("Password mismatch"),
        description: Text("Passwords do not match each other"),
        showProgressBar: true,
        autoCloseDuration: Duration(seconds: 3),
      );
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
      if (kDebugMode) {
        print("Credential : $credential");
      }
    } on FirebaseAuthException catch (e) {
      showLoggingToast(e);
      return;
    } catch (e) {
      toastification.show(
        style: .flatColored,
        type: .error,
        title: Text("Error"),
        description: Text("Error on login"),
        showProgressBar: true,
        autoCloseDuration: Duration(seconds: 3),
      );
      return;
    }
    context.read<StatusProvider>().login(false);
    if (context.mounted) context.go('/');
  }

  void showLoggingToast(FirebaseAuthException e) {
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
  }
}
