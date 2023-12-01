import 'package:flutter/cupertino.dart';

import 'edge_bookmark_tab.dart';

class EdgeBookmarkTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTabSelected;
  final List<EdgeBookmarkTabModel> tabs;

  const EdgeBookmarkTabs(
      {super.key,
      required this.selectedIndex,
      required this.onTabSelected,
      required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: tabs.indexed.map((indexedTab) {
      var (index, tab) = indexedTab;
      return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: EdgeBookmarkTab(
              isSelected: indexedTab.$1 == selectedIndex,
              onTap: () => onTabSelected(index),
              model: tab));
    }).toList());
  }
}
