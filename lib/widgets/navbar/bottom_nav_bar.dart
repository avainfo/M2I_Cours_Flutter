import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/navbar/bottom_icon.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Row(
          mainAxisAlignment: .spaceAround,
          children: [
            BottomIcon(
              icon: Icons.home,
              text: "Home",
              color: ColorScheme.light().primary,
            ),
            BottomIcon(
              icon: Icons.business,
              text: "Business",
            ),
            BottomIcon(
              icon: Icons.school,
              text: "School",
            ),
          ],
        ),
      ],
    );
  }
}
