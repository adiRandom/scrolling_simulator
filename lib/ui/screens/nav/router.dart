import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrolling_simulator/ui/screens/achievement_screen.dart';
import 'package:scrolling_simulator/ui/screens/leaderboard_screen.dart';
import 'package:scrolling_simulator/ui/screens/main_screen.dart';
import 'package:scrolling_simulator/ui/screens/nav/root_screen.dart';

class Routes {
  static const home = '/';
  static const leaderboard = '/leaderboard';
  static const achievements = '/achievements';
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => _wrapPage(const MainScreen()),
    ),
    GoRoute(
      path: Routes.leaderboard,
      pageBuilder: (context, state) => _wrapPage(LeaderboardScreen()),
    ),
    GoRoute(
      path: Routes.achievements,
      pageBuilder: (context, state) => _wrapPage(const AchievementScreen()),
    ),
  ],
);

MaterialPage _wrapPage(Widget child) =>
    MaterialPage(child: RootScreen(child: child));
