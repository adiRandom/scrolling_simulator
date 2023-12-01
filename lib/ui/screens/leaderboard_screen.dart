import 'package:flutter/material.dart';
import 'package:scrolling_simulator/domain/models/leaderboard.dart';
import 'package:scrolling_simulator/domain/models/user.dart';
import 'package:scrolling_simulator/theme/colors.dart';
import 'package:scrolling_simulator/ui/components/buttons/icon_toggle_button.dart';
import 'package:scrolling_simulator/ui/components/leaderboard/leaderboard_cell.dart';
import 'package:scrolling_simulator/ui/components/leaderboard/leaderboard_header.dart';
import 'package:scrolling_simulator/ui/components/leaderboard/leaderboard_list.dart';
import 'package:scrolling_simulator/ui/components/switch/sized_switch.dart';
import 'package:scrolling_simulator/ui/components/tabs/edge_bookmark_tabs.dart';

import '../../domain/models/metric.dart';
import '../components/tabs/edge_bookmark_tab.dart';
import '../image_constants.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<EdgeBookmarkTabModel> tabs = [
    EdgeBookmarkTabModel(
        iconPath: ImageConstants.pointsIcon,
        color: ThemeColor.pointsTabBgColor),
    EdgeBookmarkTabModel(
        iconPath: ImageConstants.distanceIcon,
        color: ThemeColor.distanceTabBgColor),
  ];

  final sampleUser = const User(
      id: 1,
      username: 'johndoe',
      avatarUrl:
          'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg');

  final currentUserLeaderboard = LeaderboardItem(
      user: const User(
          id: 1,
          username: 'johndoe',
          avatarUrl:
              'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg'),
      rank: 10,
      score: 12345,
      metric: AchievementMetric.points);

  final periodButtonIcons = [
    ImageConstants.dailyCalendarIcon,
    ImageConstants.weeklyCalendarIcon,
    ImageConstants.monthlyCalendarIcon
  ];

  LeaderboardScreen({super.key});

  MaterialStateColor get usersSelectorColor => MaterialStateColor.resolveWith(
      (states) => ThemeColor.leaderboardUserSelectorThumbColor);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 64),
        decoration: const BoxDecoration(
            image: DecorationImage(
              // scale: 10,
                image: AssetImage(ImageConstants.paperBackground),
                colorFilter: ColorFilter.mode(
                    ThemeColor.leaderboardColor, BlendMode.color),
                fit: BoxFit.fill)),
        child: Stack(children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LeaderboardHeader(
                      currentUserLeaderboard: currentUserLeaderboard),
                  const SizedBox(height: 16),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              children: periodButtonIcons
                                  .map((icon) => Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: IconToggleButton(
                                          iconPath: icon,
                                          selectedColor: ThemeColor
                                              .leaderboardSelectedColor,
                                          isSelected:
                                              // TODO: Extract in smrter state
                                              icon ==
                                                  ImageConstants
                                                      .dailyCalendarIcon,
                                          onTap: () {})))
                                  .toList()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Image(
                                  image: AssetImage(ImageConstants.friendsIcon),
                                  height: 28,
                                  width: 42),
                              const SizedBox(width: 6),
                              SizedSwitch(
                                isSelected: true,
                                onTap: () {},
                                thumbColor: usersSelectorColor,
                                width: 42,
                                height: 32,
                                activeColor:
                                    ThemeColor.leaderboardUsersSelectorColor,
                              ),
                              const SizedBox(width: 6),
                              const Image(
                                image: AssetImage(ImageConstants.worldWideIcon),
                                width: 28,
                                height: 28,
                              ),
                            ],
                          )
                        ],
                      )),
                  const SizedBox(height: 18),
                  Expanded(
                      child: Stack(
                    children: [
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: SizedBox(
                            // This makes the container fill the screen width.
                            height: 310.0,
                            // Set the height to 300 pixels.
                            child: Image.asset(
                              ImageConstants.leaderboardBackground,
                              // Replace with your image URL or asset.
                              fit: BoxFit
                                  .cover, // This will cover the area, cropping if necessary.
                            ),
                          )),
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 64),
                          child: LeaderboardList(
                              items: List.generate(
                                  20,
                                  (index) => LeaderboardItem(
                                      user: sampleUser,
                                      rank: index + 1,
                                      score: 100000 - index * 1000,
                                      metric: AchievementMetric.points))))
                    ],
                  ))
                ],
              )),
          Positioned(
              top: 0,
              left: 0,
              child: EdgeBookmarkTabs(
                  tabs: tabs, selectedIndex: 0, onTabSelected: (index) {}))
        ]));
  }
}
