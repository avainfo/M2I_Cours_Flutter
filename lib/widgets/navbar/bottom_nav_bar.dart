import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/navbar/bottom_icon.dart';

class BottomNavBar extends StatelessWidget {
  final Function func;

  const BottomNavBar({
    super.key,
    required this.func,
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
              color: ColorScheme
                  .light()
                  .primary,
              func: () => func(0),
            ),
            BottomIcon(
              icon: Icons.business,
              text: "Business",
              func: () => func(1),
            ),
            BottomIcon(
              icon: Icons.school,
              text: "School",
              func: () => func(2),
            ),
          ],
        ),
      ],
    );
  }
}
