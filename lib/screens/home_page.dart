import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/common/top_bar.dart';
import 'package:m2i_cours_flutter/widgets/common/windows_bar.dart';
import 'package:m2i_cours_flutter/widgets/home_page/home_page_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f172b),
      body: Column(
        children: [
          if (!kIsWeb && Platform.isWindows) WindowsBar(),
          TopBar(),
          HomePageContent(),
        ],
      ),
    );
  }
}
