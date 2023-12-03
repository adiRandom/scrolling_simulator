import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scrolling_simulator/theme/colors.dart';

import '../../../domain/models/achievement.dart';
import '../../../theme/text_style.dart';
import '../../image_constants.dart';

class AchievementCell extends StatelessWidget {
  final Achievement achievement;

  const AchievementCell({Key? key, required this.achievement})
      : super(key: key);

  AssetImage get backgroundImage {
    if (achievement.isUnlocked) {
      return switch (achievement.level) {
        AchievementLevel.bronze =>
          const AssetImage(ImageConstants.achievementBronzeBackground),
        AchievementLevel.silver =>
          const AssetImage(ImageConstants.achievementSilverBackground),
        AchievementLevel.gold =>
          const AssetImage(ImageConstants.achievementGoldBackground)
      };
    } else {
      return const AssetImage(ImageConstants.achievementLockedBackground);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: achievement.isUnlocked ? 1 : 0.7,
        child: Stack(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: ThemeColor.achievementCardBorderColor, width: 2),
                    image: DecorationImage(
                        image: backgroundImage, fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Row(children: [
                  Image(image: AssetImage(achievement.iconPath), width: 76),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(achievement.name,
                            style: ThemeTextStyle.lektonBold22
                                .copyWith(color: ThemeColor.darkBlue),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Text(achievement.description,
                              style: ThemeTextStyle.lektonRegular14
                                  .copyWith(color: ThemeColor.darkBlue),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Image(
                                image: AssetImage(ImageConstants.pointsIcon),
                                width: 12),
                            const SizedBox(width: 4),
                            Text(achievement.points.toString(),
                                style: ThemeTextStyle.lektonBold16
                                    .copyWith(color: ThemeColor.darkBlue)),
                          ],
                        )
                      ])),
                ])),
            Positioned.fill(
                child: BackdropFilter(
                    filter: achievement.isUnlocked
                        ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
                        : ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(color: Colors.transparent)))
          ],
        ));
  }
}
