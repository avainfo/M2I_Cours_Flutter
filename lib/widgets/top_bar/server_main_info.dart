import 'package:flutter/material.dart';

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
          child: ClipRRect(
            borderRadius: .circular(12),
            child: Image.network(
              imageUrl,
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
                child: Text(
                  serverName,
                  style: TextStyle(color: Colors.white70),
                  textAlign: .start,
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
