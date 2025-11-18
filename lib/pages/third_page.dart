import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<Widget> widgetsGetFromOnline = [];

  @override
  void initState() {
    for (int i = 0; i < 100; i++) {
      widgetsGetFromOnline.add(Text("Salut : $i"));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          itemCount: widgetsGetFromOnline.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: .symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: .circular(500),
                color: Colors.black38,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widgetsGetFromOnline[index],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }
}
