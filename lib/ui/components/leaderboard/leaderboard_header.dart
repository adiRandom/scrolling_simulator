import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/domain/models/leaderboard.dart';
import 'package:scrolling_simulator/extensions/int_extensions.dart';

import '../../../theme/text_style.dart';
import '../profile/horizontal_avatar.dart';

class LeaderboardHeader extends StatelessWidget {
  final LeaderboardItem currentUserLeaderboard;

  const LeaderboardHeader({super.key, required this.currentUserLeaderboard});

  String get headerText =>
      "Your ${currentUserLeaderboard.metric == LeaderboardType.points ? "Points" : "Distance"}";

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      HorizontalAvatar(
        username: currentUserLeaderboard.user.username,
        image: currentUserLeaderboard.user.avatarUrl,
      ),
      const SizedBox(height: 4),
      Text(headerText, style: ThemeTextStyle.lektonBold32),
      const SizedBox(height: 4),
      Text(currentUserLeaderboard.score.toShortString(),
          style: ThemeTextStyle.merienda46),
      const SizedBox(height: 16),
      Text("Rank ${currentUserLeaderboard.rank}",
          style: ThemeTextStyle.lektonItalic16),
    ]);
  }
}
