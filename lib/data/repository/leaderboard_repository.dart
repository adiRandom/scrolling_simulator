import '../../domain/models/leaderboard.dart';
import '../api/leaderboard.dart';

class LeaderboardRepository {
  static final LeaderboardRepository _singleton =
      LeaderboardRepository._internal();

  LeaderboardRepository._internal();

  factory LeaderboardRepository() {
    return _singleton;
  }

  final LeaderboardApi _api = LeaderboardApi();

  Future<Leaderboard> getLeaderboard(
      {required LeaderboardType type,
      required LeaderboardPeriod timeframe,
      required int currentUserId}) async {
    final response = await _api.getLeaderboard(type, timeframe);
    if (response.success) {
      return Leaderboard.fromEntries(
          response.data!, type, timeframe, currentUserId);
    } else {
      throw Exception('Failed to load leaderboard');
    }
  }
}
