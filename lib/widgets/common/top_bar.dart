import 'package:flutter/material.dart';

import '../home_page/top_bar/account_button.dart';
import '../home_page/top_bar/server_main_info.dart';
import '../home_page/top_bar/servers_slider.dart';
import '../home_page/top_bar/top_bar_buttons.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(vertical: 16, horizontal: 32),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          spacing: 16,
          children: [
            ServerMainInfo(),
            Divider(),
            ServersSlider(),
            TopBarButtons(),
            Divider(),
            AccountButton(),
          ],
        ),
      ),
    );
  }
}
