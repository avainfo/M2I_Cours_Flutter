import 'package:flutter/material.dart';

class ServerSliderCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final List<Color> selectedColors = const [
    Color(0xFF4F39F6),
    Color(0xFF2E2190),
  ];
  final List<Color> unselectedColors = const [
    Colors.transparent,
    Colors.transparent,
  ];

  const ServerSliderCard({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: .symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.red,
        gradient: RadialGradient(
          colors: selected ? selectedColors : unselectedColors,
          center: .topLeft,
          radius: 5,
        ),
        borderRadius: .circular(8),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(icon, color: Colors.white70),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(color: Colors.white70, fontWeight: .w500),
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}
