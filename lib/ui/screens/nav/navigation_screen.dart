import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:scrolling_simulator/theme/text_style.dart';
import 'package:scrolling_simulator/ui/image_constants.dart';
import 'package:scrolling_simulator/ui/screens/nav/router.dart';
import 'package:scrolling_simulator/ui/size_constants.dart';

import '../../components/buttons/label_asset_toggle_button.dart';

class NavigationScreen extends StatefulWidget {
  final VoidCallback onNavAway;

  const NavigationScreen({super.key, required this.onNavAway});

  static const buttonSize = 128.0;
  static const unfoldDuration = 1500;
  static const translatePaperDuration = 800;

  @override
  State<StatefulWidget> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  static const showButtonsDelayPercentage = 0.7;

  void _onButtonClick(String route, BuildContext context) {
    context.go(route);
    widget.onNavAway();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    handleDisplayButton();
  }

  void handleDisplayButton() {
    Future.delayed(
        Duration(
            milliseconds:
                (NavigationScreen.unfoldDuration * showButtonsDelayPercentage)
                    .toInt()), () {
      controller.forward();
    });
  }

  Widget makeButton(Widget button) {
    return Container(
        transform: Transform.scale(
                alignment: FractionalOffset.center,
                scale: scaleAnimation.value,
                origin: const Offset(0, 0))
            .transform,
        child: Opacity(opacity: opacityAnimation.value, child: button));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          Container(
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
                          makeButton(LabelAssetToggleButton(
                              isSelected: false,
                              iconPath: ImageConstants.feedNavButton,
                              selectedIconPath:
                                  ImageConstants.feedNavSelectedButton,
                              iconSize: NavigationScreen.buttonSize,
                              onTap: () {
                                _onButtonClick(Routes.home, context);
                              },
                              label: 'Feed'))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          makeButton(LabelAssetToggleButton(
                            label: 'Leaderboard',
                            isSelected: false,
                            iconPath: ImageConstants.leaderboardNavButton,
                            selectedIconPath:
                                ImageConstants.leaderboardNavSelectedButton,
                            iconSize: NavigationScreen.buttonSize,
                            onTap: () {
                              _onButtonClick(Routes.leaderboard, context);
                            },
                          )),
                          makeButton(LabelAssetToggleButton(
                            label: 'Achievements',
                            isSelected: false,
                            iconPath: ImageConstants.achievementNavButton,
                            selectedIconPath:
                                ImageConstants.achievementNavSelectedButton,
                            iconSize: NavigationScreen.buttonSize,
                            onTap: () {
                              _onButtonClick(Routes.achievements, context);
                            },
                          ))
                        ],
                      ),
                    ],
                  ))
                ]),
          )
        ]));
  }
}
