import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EngagementButtonType {
  like(path: "assets/icons/heart.png"),
  crossPost(path: "assets/icons/recycle.png"),
  dislike(path: "assets/icons/broken_heart.png");

  final String _path;

  const EngagementButtonType({required String path}) : _path = path;
}

class EngagementButton extends StatelessWidget {
  final EngagementButtonType type;
  final Function onPressed;
  final bool isOn;

  static const double imageSize = 50.0;

  const EngagementButton({
    super.key,
    required this.onPressed,
    required this.type,
    required this.isOn,
  });

  String get disabledPath => type._path.replaceAll(".png", "_disabled.png");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: imageSize,
        height: imageSize,
        child: GestureDetector(
            onTap: () => onPressed(),
            child: Image.asset(
              isOn ? type._path : disabledPath,
              width: imageSize,
              height: imageSize,
            )));
  }
}
