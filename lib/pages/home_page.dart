import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/counter_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("https://media.istockphoto.com/id/1399246824/fr/photo/digital-eye-wave-lines-stock-background.jpg?s=612x612&w=0&k=20&c=vzYCTiu1RWxQdqBl1lzKUaDs1oW-zzNQI7kiAVrd4xI="),
            Image.asset("assets/tortue.png"),
            CounterWidget(),
          ],
        ),
      ),
    );
  }
}

// Counter: 15
// Button : incrementer le counter
