import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/top_bar/server_slider_card.dart';

class ServersSlider extends StatelessWidget {
  const ServersSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        child: Row(
          children: [
            ServerSliderCard(
              icon: Icons.code,
              title: "Ava Info Server",
              selected: true,
            ),
            ServerSliderCard(
              icon: Icons.code,
              title: "Ava Info Server 2",
              selected: false,
            ),
          ],
        ),
      ),
    );
  }
}
