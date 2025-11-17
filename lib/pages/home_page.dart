import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/carre_rouge.dart';
import 'package:m2i_cours_flutter/widgets/home_page_column.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: .start,
          children: [
            Carre(color: Colors.red),
            Spacer(),
            HomePageColumn(),
            Spacer(),
            Carre(color: Colors.green),
          ],
        ),
      ),
    );
  }
}
