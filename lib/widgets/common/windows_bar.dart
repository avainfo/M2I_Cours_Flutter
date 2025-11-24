import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowsBar extends StatelessWidget {
  const WindowsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        windowManager.startDragging();
      },
      onDoubleTap: () async {
        if (await windowManager.isMaximized()) {
          windowManager.unmaximize();
        } else {
          windowManager.maximize();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 35,
        color: const Color(0xFF060d20),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 4,
            ),
            const Expanded(child: SizedBox()),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: FittedBox(
                child: Text(
                  "Agora",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => windowManager.minimize(),
                    icon: const Icon(Icons.minimize, color: Colors.white38),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 20,
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () async {
                      if (await windowManager.isMaximized()) {
                        windowManager.unmaximize();
                      } else {
                        windowManager.maximize();
                      }
                    },
                    icon: const Icon(Icons.crop_square, color: Colors.white38),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 20,
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => windowManager.close(),
                    icon: const Icon(Icons.close, color: Colors.white38),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 20,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
