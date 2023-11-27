import 'package:flutter/cupertino.dart';

import '../../buttons/engagement_button.dart';
import 'engagement_action.dart';

class EngagementBar extends StatelessWidget {
  final bool isLikeOn;
  final bool isDislikeOn;
  final bool isCrossPostOn;
  final Function(EngagementAction action) onEngage;

  const EngagementBar({
    super.key,
    required this.isLikeOn,
    required this.isDislikeOn,
    required this.isCrossPostOn,
    required this.onEngage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EngagementButton(
            onPressed: () {
              onEngage(EngagementAction.like);
            },
            type: EngagementButtonType.like,
            isOn: isLikeOn),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: EngagementButton(
              onPressed: () {
                onEngage(EngagementAction.dislike);
              },
              type: EngagementButtonType.dislike,
              isOn: isDislikeOn),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: EngagementButton(
              onPressed: () {
                onEngage(EngagementAction.crossPost);
              },
              type: EngagementButtonType.crossPost,
              isOn: isCrossPostOn),
        )
      ],
    );
  }
}
