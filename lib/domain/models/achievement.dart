enum AchievementLevel {
  bronze,
  silver,
  gold,
}

class Achievement {
  final int id;
  final String name;
  final String description;
  final String iconPath;
  final int points;
  final AchievementLevel level;
  final bool isUnlocked;

  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.iconPath,
    required this.points,
    required this.level,
    required this.isUnlocked,
  });
}

class AchievementGroup {
  final int id;
  final String name;
  final String iconPath;
  final List<Achievement> achievements;

  const AchievementGroup({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.achievements,
  });
}
