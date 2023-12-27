import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:scrolling_simulator/theme/text_style.dart';
import 'package:scrolling_simulator/ui/image_constants.dart';
import 'package:scrolling_simulator/ui/screens/nav/router.dart';
import 'package:scrolling_simulator/ui/size_constants.dart';

import '../../components/buttons/label_asset_toggle_button.dart';

class NavigationScreen extends StatelessWidget {
  final VoidCallback onNavAway;

  const NavigationScreen({super.key, required this.onNavAway});

  static const buttonSize = 128.0;

  void _onButtonClick(String route, BuildContext context) {
    context.go(route);
    onNavAway();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstants.navigationBackground),
              fit: BoxFit.cover)),
      padding: const EdgeInsets.only(
          top: SizeConstants.topScreenPadding,
          bottom: SizeConstants.compassBottomPadding),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Menu", style: ThemeTextStyle.merienda46),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LabelAssetToggleButton(
                        isSelected: false,
                        iconPath: ImageConstants.feedNavButton,
                        selectedIconPath: ImageConstants.feedNavSelectedButton,
                        iconSize: NavigationScreen.buttonSize,
                        onTap: () {
                          _onButtonClick(Routes.home, context);
                        },
                        label: 'Feed')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LabelAssetToggleButton(
                      label: 'Leaderboard',
                      isSelected: false,
                      iconPath: ImageConstants.leaderboardNavButton,
                      selectedIconPath:
                          ImageConstants.leaderboardNavSelectedButton,
                      iconSize: NavigationScreen.buttonSize,
                      onTap: () {
                        _onButtonClick(Routes.leaderboard, context);
                      },
                    ),
                    LabelAssetToggleButton(
                      label: 'Achievements',
                      isSelected: false,
                      iconPath: ImageConstants.achievementNavButton,
                      selectedIconPath:
                          ImageConstants.achievementNavSelectedButton,
                      iconSize: NavigationScreen.buttonSize,
                      onTap: () {
                        _onButtonClick(Routes.achievements, context);
                      },
                    )
                  ],
                ),
              ],
            ))
          ]),
    );
  }
}
