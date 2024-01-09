import 'package:scrolling_simulator/data/api/topic.dart';
import 'package:scrolling_simulator/data/dto/user.dart';
import 'package:scrolling_simulator/extensions/list_extensions.dart';

class PostDto {
  final String? title;
  final String? subtitle;
  final String? body;
  final String? imageUrl;
  final int id;
  final UserDto? author;
  final List<TopicDto> topics;

  const PostDto({
    required this.id,
    this.author,
    required this.body,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.topics,
  });

  factory PostDto.fromJSON(Map<String, dynamic> json) {
    return PostDto(
      id: json['id'],
      author: json['author'] != null ? UserDto.fromJson(json['author']) : null,
      body: json['body'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      subtitle: json['subtitle'],
      topics: (json['topics'] as List<dynamic>)
          .decodeList((topic) => TopicDto.fromJSON(topic))
          .toList(),
    );
  }
}
