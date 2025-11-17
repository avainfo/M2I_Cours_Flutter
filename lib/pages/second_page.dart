import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/navbar/bottom_nav_bar.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          BottomNavBar(),
        ],
      ),
    );
  }
}
