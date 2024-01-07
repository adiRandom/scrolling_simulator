import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_simulator/domain/models/leaderboard.dart';

import '../list/dynamic_fade_list.dart';
import 'leaderboard_cell.dart';

class LeaderboardList extends StatelessWidget {
  final List<LeaderboardItem> items;

  const LeaderboardList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return DynamicFadeList(
        itemCount: items.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: LeaderboardCell(
                  user: items[index].user,
                  rank: items[index].rank,
                  score: items[index].score,
                  // TODO: do id check
                  isCurrentUser: index == 9),
            ));
  }
}
