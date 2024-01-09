import 'package:scrolling_simulator/data/api/topic.dart';

class Topic {
  final int id;
  final String name;
  final String emoji;

  const Topic({
    required this.id,
    required this.name,
    required this.emoji,
  });

  factory Topic.fromDto(TopicDto topic) {
    return Topic(
      id: topic.id,
      name: topic.name,
      emoji: topic.emoji,
    );
  }
}
