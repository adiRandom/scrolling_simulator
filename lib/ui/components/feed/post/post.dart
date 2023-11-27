import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/theme/colors.dart';
import 'package:scrolling_simulator/ui/components/feed/post/engagement_action.dart';
import 'package:scrolling_simulator/ui/components/feed/post/engagement_bar.dart';
import 'package:scrolling_simulator/ui/components/feed/post/post_header.dart';
import 'package:scrolling_simulator/ui/components/feed/post/topic.dart';
import 'package:scrolling_simulator/ui/components/feed/skeleton.dart';

import '../../../../domain/models/post.dart';
import '../../../../theme/text_style.dart';
import '../../../image_constants.dart';

class Post extends StatelessWidget {
  final PostModel post;
  final int postIndex;
  final bool isLiked;
  final bool isDisliked;
  final bool isCrossPosted;
  final Function(EngagementAction action) onEngage;

  const Post({
    super.key,
    required this.post,
    required this.postIndex,
    required this.isLiked,
    required this.isDisliked,
    required this.isCrossPosted,
    required this.onEngage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Expanded(
          child: ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(ThemeColor.postColor, BlendMode.color),
              child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    postBackground,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )))),
      Container(
          padding: const EdgeInsets.only(top: 64, left: 24, right: 32),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            PostHeader(post: post),
            Container(
                margin: const EdgeInsets.only(top: 24),
                child: const Skeleton(variant: SkeletonVariant.triple)),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child:
                  Text(post.content ?? "", style: ThemeTextStyle.bodyTextStyle),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Skeleton(variant: SkeletonVariant.double)),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: EngagementBar(
                isLikeOn: isLiked,
                isDislikeOn: isDisliked,
                isCrossPostOn: isCrossPosted,
                onEngage: onEngage,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    runAlignment: WrapAlignment.start,
                    alignment: WrapAlignment.start,
                    children: List.generate(
                      post.topics.length,
                      (index) => TopicWidget(topic: post.topics[index]),
                    ),
                  ),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("-$postIndex-", style: ThemeTextStyle.subtitleTextStyle)
                ],
              ),
            ),
          ]))
    ]);
  }
}
