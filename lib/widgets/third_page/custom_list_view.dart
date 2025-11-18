import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final ScrollController _scrollController;
  final List<Widget> widgetsGetFromOnline;

  const CustomListView({
    super.key,
    required ScrollController scrollController,
    required this.widgetsGetFromOnline,
  }) : _scrollController = scrollController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        controller: _scrollController,
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
    );
  }
}
