import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/utils/app_direction.dart';

class ScrollerIconButton extends StatelessWidget {
  const ScrollerIconButton({
    super.key,
    required this.scrollCtrl,
    required this.direction,
  });

  final ScrollController scrollCtrl;
  final AppDirection direction;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        scrollCtrl.animateTo(
          scrollCtrl.position.pixels + direction.offset,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
        );
      },
      icon: Icon(
        (direction == AppDirection.left)
            ? Icons.chevron_left_rounded
            : Icons.chevron_right_rounded,
      ),
    );
  }
}
