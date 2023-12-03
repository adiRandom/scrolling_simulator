import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/domain/models/achievement.dart';
import 'package:scrolling_simulator/theme/text_style.dart';

class AchievementSectionHeader extends StatelessWidget {
  final AchievementGroup group;

  const AchievementSectionHeader({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(group.iconPath), width: 24),
          const SizedBox(width: 16),
          Text(group.name, style: ThemeTextStyle.lexendLight20)
        ],
      ),
    );
  }
}
