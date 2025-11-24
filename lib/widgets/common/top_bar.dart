import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/top_bar/server_main_info.dart';
import 'package:m2i_cours_flutter/widgets/top_bar/servers_slider.dart';
import 'package:m2i_cours_flutter/widgets/top_bar/top_bar_icons.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ServerMainInfo(),
        ServersSlider(),
        TopBarIcons(),
      ],
    );
  }
}
