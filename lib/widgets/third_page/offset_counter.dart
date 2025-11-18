import 'package:flutter/material.dart';

class OffsetCounter extends StatelessWidget {
  const OffsetCounter({
    super.key,
    required this.scrollOffset,
  });

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height / 20,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 50,
        color: Colors.red,
        child: FittedBox(
          child: Text(
            "Position Actuel : ${scrollOffset.toStringAsFixed(2)}",
            textAlign: .center,
          ),
        ),
      ),
    );
  }
}
