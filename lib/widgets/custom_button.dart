import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF1D4ED8),
      borderRadius: .circular(8),
      child: InkWell(
        onTap: () {
          print("tap");
        },
        splashColor: Colors.green,
        borderRadius: .circular(8),
        child: Container(
          padding: .symmetric(horizontal: 24, vertical: 12),
          child: CustomText(text: "Incrémenter le counter"),
        ),
      ),
    );
  }
}
