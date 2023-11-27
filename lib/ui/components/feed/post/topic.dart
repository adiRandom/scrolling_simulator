import 'package:flutter/cupertino.dart';

import '../../../../domain/models/topic.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/text_style.dart';

class TopicWidget extends StatelessWidget {
  final Topic topic;

  const TopicWidget({
    super.key,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: ThemeColor.topicColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text("${topic.emoji}${topic.name}",
          style: ThemeTextStyle.topicTextStyle),
    );
  }
}
