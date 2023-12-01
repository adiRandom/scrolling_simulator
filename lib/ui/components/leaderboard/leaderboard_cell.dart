import 'package:flutter/material.dart';
import 'package:scrolling_simulator/domain/models/user.dart';
import 'package:scrolling_simulator/theme/colors.dart';

import '../../../theme/text_style.dart';

class LeaderboardCell extends StatelessWidget {
  final User user;
  final int rank;
  final int score;
  final bool isCurrentUser;

  const LeaderboardCell(
      {super.key,
      required this.user,
      required this.rank,
      required this.score,
      required this.isCurrentUser});

  Color get backgroundColor => isCurrentUser
      ? ThemeColor.leaderboardSelectedColor
      : ThemeColor.leaderboardCellColor.withAlpha(0x80);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: ThemeColor.leaderboardCellColor,
              width: 2),
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Row(children: [
          Text("$rank.", style: ThemeTextStyle.lektonBold16),
          const SizedBox(width: 8),
          CircleAvatar(
              radius: 16, backgroundImage: NetworkImage(user.avatarUrl)),
          const SizedBox(width: 8),
          Text("@${user.username}", style: ThemeTextStyle.lektonItalic16),
          const Expanded(child: SizedBox()),
          Text("$score", style: ThemeTextStyle.lektonItalic18),
        ]));
  }
}
