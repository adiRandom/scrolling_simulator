import 'package:flutter/material.dart';
import 'package:scrolling_simulator/domain/models/leaderboard.dart';
import 'package:scrolling_simulator/domain/services/leaderboard_service.dart';
import 'package:scrolling_simulator/theme/colors.dart';
import 'package:scrolling_simulator/ui/components/buttons/border_icon_toggle_button.dart';
import 'package:scrolling_simulator/ui/components/leaderboard/leaderboard_header.dart';
import 'package:scrolling_simulator/ui/components/leaderboard/leaderboard_list.dart';
import 'package:scrolling_simulator/ui/components/switch/sized_switch.dart';
import 'package:scrolling_simulator/ui/size_constants.dart';

import '../../components/tabs/edge_bookmark_tab.dart';
import '../../components/tabs/edge_bookmark_tabs.dart';
import '../../image_constants.dart';

class LeaderboardScreen extends StatefulWidget {
  final List<EdgeBookmarkTabModel> tabs = [
    EdgeBookmarkTabModel(
        iconPath: ImageConstants.pointsIcon,
        color: ThemeColor.pointsTabBgColor),
    EdgeBookmarkTabModel(
        iconPath: ImageConstants.distanceIcon,
        color: ThemeColor.distanceTabBgColor),
  ];

  final periodButtonIcons = [
    ImageConstants.dailyCalendarIcon,
    ImageConstants.weeklyCalendarIcon,
    ImageConstants.monthlyCalendarIcon
  ];

  LeaderboardScreen({super.key});

  MaterialStateColor get usersSelectorColor => MaterialStateColor.resolveWith(
      (states) => ThemeColor.leaderboardUserSelectorThumbColor);

  @override
  State<StatefulWidget> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  bool isVisibilityWorldwide = false;
  LeaderboardPeriod period = LeaderboardPeriod.daily;
  LeaderboardType type = LeaderboardType.points;

  void _onTabSelected(int index) {
    setState(() {
      type = LeaderboardType.values[index];
    });
  }

  void _onPeriodSelected(int index) {
    setState(() {
      period = LeaderboardPeriod.values[index];
    });
  }

  void _onVisibilityWorldwideSelected(isSelected) {
    setState(() {
      isVisibilityWorldwide = isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            LeaderboardService().getLeaderboard(type: type, timeframe: period),
        builder: (BuildContext context, AsyncSnapshot<Leaderboard> snapshot) {
          var leaderboard = snapshot.data;

          return Container(
              width: double.infinity,
              height: double.infinity,
              padding:
                  const EdgeInsets.only(top: SizeConstants.topScreenPadding),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      // scale: 10,
                      image: AssetImage(ImageConstants.paperBackground),
                      colorFilter: ColorFilter.mode(
                          ThemeColor.leaderboardColor, BlendMode.color),
                      fit: BoxFit.fill)),
              child: Stack(children: [
                if (snapshot.connectionState == ConnectionState.waiting)
                  const Center(child: CircularProgressIndicator()),
                if (leaderboard != null)
                  SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LeaderboardHeader(
                              currentUserLeaderboard:
                                  leaderboard.currentUserEntry),
                          const SizedBox(height: 16),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                      children: widget.periodButtonIcons.indexed
                                          .map((indexedIcon) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4),
                                              child: BorderIconToggleButton(
                                                  iconPath: indexedIcon.$2,
                                                  selectedColor: ThemeColor
                                                      .leaderboardSelectedColor,
                                                  isSelected: indexedIcon.$1 ==
                                                      LeaderboardPeriod.values
                                                          .indexOf(period),
                                                  onTap: () {
                                                    _onPeriodSelected(
                                                        indexedIcon.$1);
                                                  })))
                                          .toList()),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              ImageConstants.friendsIcon),
                                          height: 28,
                                          width: 42),
                                      const SizedBox(width: 6),
                                      SizedSwitch(
                                        isSelected: isVisibilityWorldwide,
                                        onTap: _onVisibilityWorldwideSelected,
                                        thumbColor: widget.usersSelectorColor,
                                        width: 42,
                                        height: 32,
                                        inactiveTrackColor: ThemeColor
                                            .leaderboardUsersSelectorColor,
                                        activeColor: ThemeColor
                                            .leaderboardUsersSelectorColor,
                                      ),
                                      const SizedBox(width: 6),
                                      const Image(
                                        image: AssetImage(
                                            ImageConstants.worldWideIcon),
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
                                      left: 24,
                                      right: 24,
                                      bottom:
                                          SizeConstants.compassBottomPadding),
                                  child:
                                      LeaderboardList(items: leaderboard.items))
                            ],
                          ))
                        ],
                      )),
                Positioned(
                    top: 0,
                    left: 0,
                    child: EdgeBookmarkTabs(
                        tabs: widget.tabs,
                        selectedIndex: LeaderboardType.values.indexOf(type),
                        onTabSelected: _onTabSelected))
              ]));
        });
  }
}
