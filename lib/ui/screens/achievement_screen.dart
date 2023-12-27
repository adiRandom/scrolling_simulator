import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/domain/models/achievement.dart';
import 'package:scrolling_simulator/theme/colors.dart';
import 'package:scrolling_simulator/ui/components/achievement/achievement_section_header.dart';

import '../../theme/text_style.dart';
import '../components/achievement/achievement_cell.dart';
import '../components/list/dynamic_fade_list.dart';
import '../image_constants.dart';
import '../size_constants.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({super.key});

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  final List<AchievementGroup> achievementGroups = [
    const AchievementGroup(
        id: 1,
        name: "Sample Achievements",
        iconPath: ImageConstants.trophyAchievementIcon,
        achievements: [
          Achievement(
              id: 1,
              name: "Sample Achievement",
              description: "This is a sample achievement",
              iconPath: ImageConstants.trophyAchievementIcon,
              points: 1000,
              level: AchievementLevel.bronze,
              isUnlocked: true),
          Achievement(
              id: 2,
              name: "Sample Achievement",
              description: "This is a sample achievement",
              iconPath: ImageConstants.trophyAchievementIcon,
              points: 1000,
              level: AchievementLevel.silver,
              isUnlocked: true),
          Achievement(
              id: 3,
              name: "Sample Achievement",
              description: "This is a sample achievement",
              iconPath: ImageConstants.trophyAchievementIcon,
              points: 1000,
              level: AchievementLevel.gold,
              isUnlocked: true),
          // Achievement(
          //     id: 4,
          //     name: "Sample Achievement",
          //     description: "This is a sample achievement",
          //     iconPath: ImageConstants.trophyAchievementIcon,
          //     points: 1000,
          //     level: AchievementLevel.bronze,
          //     isUnlocked: false),
        ]),
    const AchievementGroup(
        id: 2,
        name: "Sample Achievements",
        iconPath: ImageConstants.trophyAchievementIcon,
        achievements: [
          Achievement(
              id: 1,
              name: "Sample Achievement",
              description: "This is a sample achievement",
              iconPath: ImageConstants.trophyAchievementIcon,
              points: 1000,
              level: AchievementLevel.bronze,
              isUnlocked: true),
          Achievement(
              id: 2,
              name: "Sample Achievement",
              description: "This is a sample achievement",
              iconPath: ImageConstants.trophyAchievementIcon,
              points: 1000,
              level: AchievementLevel.silver,
              isUnlocked: true),
          Achievement(
              id: 3,
              name: "Sample Achievement",
              description: "This is a sample achievement",
              iconPath: ImageConstants.trophyAchievementIcon,
              points: 1000,
              level: AchievementLevel.gold,
              isUnlocked: true),
          Achievement(
              id: 4,
              name: "Sample Achievement",
              description: "This is a sample achievement",
              iconPath: ImageConstants.trophyAchievementIcon,
              points: 1000,
              level: AchievementLevel.bronze,
              isUnlocked: false),
        ])
  ];

  List<Widget> buildSections() {
    var widgets = <Widget>[];

    for (var group in achievementGroups) {
      widgets.add(AchievementSectionHeader(group: group));

      for (var achievement in group.achievements) {
        widgets.add(Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: AchievementCell(achievement: achievement)));
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final listWidgets = buildSections();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  ThemeColor.achievementBgColor, BlendMode.color),
              image: AssetImage(ImageConstants.paperBackground),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(ImageConstants.achievementBgMedal,
                  width: 180, height: 150)),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(ImageConstants.achievementBgTrophy,
                  width: 190, height: 240)),
          Padding(
              padding: const EdgeInsets.only(
                  top: 116, bottom: SizeConstants.compassBottomPadding),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Achievements",
                        style: ThemeTextStyle.merienda46
                            .copyWith(color: ThemeColor.darkBlue)),
                    const SizedBox(height: 12),
                    Expanded(
                        child: DynamicFadeList(
                      threshold: 50,
                      stops: const [0.0, 0.1, 0.8, 1.0],
                      itemCount: listWidgets.length,
                      itemBuilder: (context, index) => listWidgets[index],
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
