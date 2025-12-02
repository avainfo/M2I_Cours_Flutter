import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/data/models/server.dart';
import 'package:m2i_cours_flutter/providers/servers_provider.dart';
import 'package:provider/provider.dart';

class ServerMainInfo extends StatelessWidget {
  final String serverName = "Ava Info Server";
  final int channelsCount = 4;
  final String imageUrl =
      "https://avatars.githubusercontent.com/u/122133590?v=4";

  const ServerMainInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        SizedBox(
          width: 45,
          height: 45,
          child: ClipRRect(
            borderRadius: .circular(12),
            child: Selector<ServersProvider, Server?>(
              selector: (_, servers) => servers.selectedServer,
              builder: (_, value, _) {
                if (value == null) {
                  return Image.network(
                    imageUrl,
                    fit: .cover,
                  );
                }
                return Image.network(
                  value.imageUrl,
                  fit: .cover,
                );
              },
            ),
          ),
        ),

        Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            SizedBox(
              height: 25,
              child: FittedBox(
                child: Selector<ServersProvider, Server?>(
                  selector: (_, serverProvider) =>
                      serverProvider.selectedServer,
                  builder: (_, server, _) => Text(
                    (server == null) ? "Loading" : server.name,
                    style: TextStyle(color: Colors.white70),
                    textAlign: .start,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: FittedBox(
                child: Text(
                  "$channelsCount channels",
                  style: TextStyle(color: Colors.white38),
                  textAlign: .start,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
