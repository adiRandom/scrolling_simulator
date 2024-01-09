import 'package:scrolling_simulator/domain/models/topic.dart';
import 'package:scrolling_simulator/domain/models/user.dart';

import '../../data/dto/post.dart';

class PostModel {
  final String? title;
  final String? subtitle;
  final String? body;
  final String? imageUrl;
  final int id;
  final User? author;
  final List<Topic> topics;

  const PostModel({
    required this.id,
    required this.author,
    required this.body,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.topics,
  });

  factory PostModel.fromDto(PostDto dto) => PostModel(
        id: dto.id,
        title: dto.title,
        subtitle: dto.subtitle,
        body: dto.body,
        imageUrl: dto.imageUrl,
        author: dto.author != null ? User.fromDto(dto.author!) : null,
        topics: dto.topics.map((topic) => Topic.fromDto(topic)).toList(),
      );
}
