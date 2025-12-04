import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m2i_cours_flutter/utils/pref_keys.dart';
import 'package:m2i_cours_flutter/widgets/common/windows_bar.dart';
import 'package:m2i_cours_flutter/widgets/login_page/login_panel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    _checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f172b),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: AlignmentGeometry.xy(-2, -2),
            radius: 1.5,
            colors: [
              Color(0x652A4269),
              Color(0xFF0f172b),
            ],
          ),
        ),
        child: Column(
          children: [
            if (!kIsWeb && Platform.isWindows) WindowsBar(),
            LoginPanel(),
          ],
        ),
      ),
    );
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(PrefKeys.isLoggedIn) ?? false) {
      if (mounted) {
        context.go("/");
      }
    }
  }
}
