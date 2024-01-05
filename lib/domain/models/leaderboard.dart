import 'package:scrolling_simulator/domain/models/user.dart';

import '../../data/dto/leaderboard.dart';

class LeaderboardItem {
  final User user;
  final int rank;
  final int score;
  final LeaderboardType metric;
  final LeaderboardPeriod period;

  LeaderboardItem(
      {required this.user,
      required this.rank,
      required this.score,
      required this.metric,
      required this.period});
}

enum LeaderboardPeriod { daily, weekly, monthly }

enum LeaderboardType { points, distance }

class Leaderboard {
  final List<LeaderboardItem> items;
  final LeaderboardType metric;
  final LeaderboardPeriod period;

  Leaderboard(
      {required this.items, required this.metric, required this.period});

  factory Leaderboard.fromEntries(List<LeaderboardEntryDto> entries,
      LeaderboardType metric, LeaderboardPeriod period) {
    List<LeaderboardItem> items = [];
    for (int i = 0; i < entries.length; i++) {
      final entry = entries[i];

      items.add(LeaderboardItem(
          user: User.fromDto(entry.user),
          rank: i + 1,
          score: entry.value,
          metric: metric,
          period: period));
    }

    return Leaderboard(items: items, metric: metric, period: period);
  }
}
