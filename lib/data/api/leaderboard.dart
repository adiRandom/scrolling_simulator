import '../../domain/models/leaderboard.dart';
import '../dto/leaderboard.dart';
import '../types.dart';
import 'client.dart';

class LeaderboardApi {
  final ApiClient _client = ApiClient();

  static const baseUrl = 'leaderboard/';

  Future<ApiResponse<List<LeaderboardEntryDto>>> getLeaderboard(
      LeaderboardType type, LeaderboardPeriod timeframe) async {
    final response = await _client.get(
        '$baseUrl?leaderboard_type=${type.name}&timeframe=${timeframe.name}',
        (bodyJson) => _client.decodeList(
            bodyJson, (jsonBody) => LeaderboardEntryDto.fromJson(jsonBody)));

    return response;
  }
}
