import 'package:flutter/material.dart';

class ServerMainInfo extends StatelessWidget {
  const ServerMainInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.height / 15,
          child: ClipRRect(
            borderRadius: .circular(12),
            child: Image.network(
              "https://avatars.githubusercontent.com/u/122133590?v=4",
            ),
          ),
        ),
      ],
    );
  }
}
