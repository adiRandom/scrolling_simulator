class TopicDto {
  final int id;
  final String name;
  final String emoji;

  const TopicDto({
    required this.id,
    required this.name,
    required this.emoji,
  });

  factory TopicDto.fromJSON(Map<String, dynamic> json) {
    return TopicDto(
      id: json['id'],
      name: json['name'],
      emoji: json['emoji'],
    );
  }
}
