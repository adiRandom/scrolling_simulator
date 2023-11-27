import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrolling_simulator/domain/models/post.dart';
import 'package:scrolling_simulator/domain/models/topic.dart';
import 'package:scrolling_simulator/domain/models/user.dart';
import 'package:scrolling_simulator/ui/components/feed/post/engagement_action.dart';
import 'package:scrolling_simulator/ui/components/feed/post/post.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
        title: 'Scrolling Simulator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  Post(
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
          onEngage: onEngage ,
        ));
  }
}
