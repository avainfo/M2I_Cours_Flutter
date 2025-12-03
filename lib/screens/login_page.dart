import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/common/windows_bar.dart';
import 'package:m2i_cours_flutter/widgets/login_page/login_panel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f172b),
      body: Column(
        children: [
          if (!kIsWeb && Platform.isWindows) WindowsBar(),
          LoginPanel(),
        ],
      ),
    );
  }
}
