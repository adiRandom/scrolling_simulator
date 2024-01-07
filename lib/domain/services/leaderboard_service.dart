import 'package:scrolling_simulator/data/repository/leaderboard_repository.dart';
import 'package:scrolling_simulator/data/repository/user_repository.dart';

import '../models/leaderboard.dart';

class LeaderboardService {
  static final LeaderboardService _instance = LeaderboardService._internal();

  LeaderboardService._internal();

  factory LeaderboardService() => _instance;

  UserRepository userRepository = UserRepository();
  LeaderboardRepository leaderboardRepository = LeaderboardRepository();

  Future<Leaderboard> getLeaderboard(
      {required LeaderboardType type, required LeaderboardPeriod timeframe}) {
    return leaderboardRepository.getLeaderboard(
        type: type,
        timeframe: timeframe,
        currentUserId: userRepository.getCurrentUser().id);
  }
}
