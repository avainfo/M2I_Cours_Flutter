import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function() func;

  const BottomIcon({
    super.key,
    this.icon = Icons.question_mark_rounded,
    this.text = "Not configured",
    this.color = Colors.black38,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func();
      },
      borderRadius: .circular(50),
      child: Padding(
        padding: .all(16.0),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
