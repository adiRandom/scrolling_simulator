import 'package:scrolling_simulator/domain/models/metric.dart';
import 'package:scrolling_simulator/domain/models/user.dart';

class LeaderboardItem {
  final User user;
  final int rank;
  final int score;
  final AchievementMetric metric;

  LeaderboardItem(
      {required this.user,
      required this.rank,
      required this.score,
      required this.metric});
}


