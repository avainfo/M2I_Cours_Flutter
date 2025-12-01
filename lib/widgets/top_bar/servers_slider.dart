import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/data/repositories/servers_repo.dart';
import 'package:m2i_cours_flutter/providers/servers_provider.dart';
import 'package:m2i_cours_flutter/widgets/top_bar/basic_icon_button.dart';
import 'package:m2i_cours_flutter/widgets/top_bar/server_slider_card.dart';
import 'package:provider/provider.dart';

import '../../data/models/Server.dart';

class ServersSlider extends StatefulWidget {
  const ServersSlider({
    super.key,
  });

  @override
  State<ServersSlider> createState() => _ServersSliderState();
}

class _ServersSliderState extends State<ServersSlider> {
  final ScrollController _scrollCtrl = ScrollController();
  int selected = 0;

  @override
  void initState() {
    super.initState();
    ServersRepo.getServers().then(
      (servers) {
        if (!context.mounted) return;
        context.read<ServersProvider>().updateServers(servers);
      },
    );
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          ScrollerIconButton(direction: .left, scrollCtrl: _scrollCtrl),
          Expanded(
            child: SizedBox(
              height: 50,
              child: Selector<ServersProvider, List<Server>>(
                selector: (_, servers) => servers.servers,
                builder: (_, servers, _) {
                  return Listener(
                    onPointerSignal: (ps) {
                      if (ps is PointerScrollEvent) {
                        final delta = ps.scrollDelta.dy;
                        final target = (_scrollCtrl.position.pixels + delta * 2)
                            .clamp(
                              0.0,
                              _scrollCtrl.position.maxScrollExtent,
                            );

                        _scrollCtrl.jumpTo(target);
                      }
                    },
                    child: ListView.builder(
                      scrollDirection: .horizontal,
                      controller: _scrollCtrl,
                      itemBuilder: (context, index) => ServerSliderCard(
                        icon: Icons.code,
                        title: servers[index].name,
                        selected: selected == index,
                        setSelected: () {
                          if (selected == index) return;
                          context.read<ServersProvider>().updateSelectedServers(
                            servers[index],
                          );
                          setState(() {
                            selected = index;
                          });
                        },
                      ),
                      itemCount: servers.length,
                    ),
                  );
                },
              ),
            ),
          ),
          ScrollerIconButton(direction: .right, scrollCtrl: _scrollCtrl),
        ],
      ),
    );
  }
}
