import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/custom_button.dart';
import 'package:m2i_cours_flutter/widgets/custom_text.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: "Counter : $counter"),
        CustomButton(),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
            print(counter);
          },
          child: CustomText(text: "Incrémenter le counter"),
        ),
      ],
    );
  }
}
