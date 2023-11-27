import 'package:scrolling_simulator/domain/models/topic.dart';
import 'package:scrolling_simulator/domain/models/user.dart';

class PostModel {
  final String? title;
  final String? subtitle;
  final String? content;
  final String? imageUrl;
  final int id;
  final User? author;
  final List<Topic> topics;

  const PostModel({
    required this.id,
    required this.author,
    required this.content,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.topics,
  });
}
