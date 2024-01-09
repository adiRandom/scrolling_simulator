import 'package:flutter/material.dart';
import 'package:scrolling_simulator/data/repository/post_repository.dart';

import '../../data/types.dart';
import '../../domain/models/post.dart';
import '../components/feed/post/engagement_action.dart';
import '../components/feed/post/post.dart';
import '../components/list/infinite_page_viewer.dart';

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

  Future<PaginatedData<PostModel>> getPage(int page) =>
      PostRepository().getPostsPage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return InfinitePageViewer<PostModel>(
              pageRequest: getPage,
              itemBuilder: (ctx, post) => SizedBox(
                  height: constraints.maxHeight,
                  child: Post(
                    post: post,
                    postIndex: 12,
                    isLiked: isLiked,
                    isDisliked: isDisliked,
                    isCrossPosted: isCrossPosted,
                    onEngage: onEngage,
                  )),
              threshold: 2);
        }));
  }
}
