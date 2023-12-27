import 'package:flutter/material.dart';

import '../../domain/models/post.dart';
import '../../domain/models/topic.dart';
import '../../domain/models/user.dart';
import '../components/feed/post/engagement_action.dart';
import '../components/feed/post/post.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  bool isLiked = false;
  bool isDisliked = false;
  bool isCrossPosted = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void toggleDislike() {
    setState(() {
      isDisliked = !isDisliked;
    });
  }

  void toggleCrossPost() {
    setState(() {
      isCrossPosted = !isCrossPosted;
    });
  }

  void onEngage(EngagementAction action) {
    switch (action) {
      case EngagementAction.like:
        toggleLike();
        break;
      case EngagementAction.dislike:
        toggleDislike();
        break;
      case EngagementAction.crossPost:
        toggleCrossPost();
        break;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Post(
      post: const PostModel(
        id: 1,
        topics: [
          Topic(
            id: 1,
            emoji: '🔥',
            name: 'Fire',
          ),
          Topic(
            id: 2,
            emoji: '📰',
            name: 'News',
          ),
        ],
        author: User(
          id: 1,
          username: 'johndoe',
          avatarUrl:
              'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
        ),
        content:
            'When you light a candle to set the mood and accidentally summon a fire elemental. 🔥🔥 #DateNightGoneWrong',
        imageUrl:
            'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
        title: 'My Really Long Headline Lorem Ipsum Test',
        subtitle: 'Subtitle more info etc who the fuck asked',
      ),
      postIndex: 12,
      isLiked: isLiked,
      isDisliked: isDisliked,
      isCrossPosted: isCrossPosted,
      onEngage: onEngage,
    );
  }
}
