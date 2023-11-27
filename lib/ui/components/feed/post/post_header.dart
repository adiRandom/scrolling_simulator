import 'package:flutter/cupertino.dart';

import '../../../../domain/models/post.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/text_style.dart';
import '../../profile/author.dart';

class PostHeader extends StatelessWidget {
 final PostModel post;

  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (post.author != null)
                Author(
                  username: post.author!.username,
                  image: post.author!.avatarUrl,
                ),
              Container(
                margin: post.author != null ? const EdgeInsets.only(top: 8) : null,
                child: Text(post.title ?? "",
                    style: ThemeTextStyle.titleTextStyle),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(post.subtitle ?? "",
                    style: ThemeTextStyle.subtitleTextStyle),
              ),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 16, top: 8),
            width: 128,
            height: 160,
            decoration: const BoxDecoration(
              color: ThemeColor.auxPostColor,
            ),
            child: Image.network(
              post.imageUrl ?? "",
              fit: BoxFit.cover,
            ))
      ],
    );
  }
}