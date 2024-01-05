import 'package:scrolling_simulator/data/dto/user.dart';

import '../../domain/models/leaderboard.dart';

class LeaderboardTypeDto {
  final LeaderboardType type;
  final LeaderboardPeriod timeframe;

  LeaderboardTypeDto({required this.type, required this.timeframe});

  factory LeaderboardTypeDto.fromJson(Map<String, dynamic> json) {
    return LeaderboardTypeDto(
      type: LeaderboardType.values
          .firstWhere((e) => e.toString() == 'LeaderboardType.${json['type']}'),
      timeframe: LeaderboardPeriod.values.firstWhere(
          (e) => e.toString() == 'LeaderboardTimeframe.${json['timeframe']}'),
    );
  }
}

class LeaderboardEntryDto {
  final UserDto user;
  final int value;

  LeaderboardEntryDto({required this.user, required this.value});

  factory LeaderboardEntryDto.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntryDto(
      user: UserDto.fromJson(json['user']),
      value: json['value'],
    );
  }
}
