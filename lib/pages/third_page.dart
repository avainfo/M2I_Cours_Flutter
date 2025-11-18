import 'package:flutter/material.dart';
import 'package:m2i_cours_flutter/widgets/third_page/custom_list_view.dart';
import 'package:m2i_cours_flutter/widgets/third_page/offset_counter.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<Widget> widgetsGetFromOnline = [];
  final ScrollController _scrollController = ScrollController();
  double scrollOffset = 0;

  @override
  void initState() {
    for (int i = 0; i < 100; i++) {
      widgetsGetFromOnline.add(Text("Salut : $i"));
    }
    _scrollController.addListener(() {
      if ((_scrollController.offset - scrollOffset).abs() > 100) {
        setState(() {
          scrollOffset = _scrollController.offset;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: .topCenter,
        children: [
          CustomListView(
            scrollController: _scrollController,
            widgetsGetFromOnline: widgetsGetFromOnline,
          ),
          OffsetCounter(scrollOffset: scrollOffset),
        ],
      ),
    );
  }
}
