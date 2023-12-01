import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/ui/image_constants.dart';

class EdgeBookmarkTabModel {
  final String iconPath;
  final Color color;

  EdgeBookmarkTabModel({required this.iconPath, required this.color});
}

class EdgeBookmarkTab extends StatelessWidget {
  final EdgeBookmarkTabModel model;
  final bool isSelected;
  final Function() onTap;

  const EdgeBookmarkTab(
      {Key? key,
      required this.isSelected,
      required this.onTap,
      required this.model})
      : super(key: key);

  static const animationDuration = Duration(milliseconds: 300);

  double get width => isSelected ? 86 : 64;

  double get leftPadding => isSelected ? 40 : 12;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage(ImageConstants.paperBackground),
                colorFilter: ColorFilter.mode(model.color, BlendMode.color),
                fit: BoxFit.cover),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24)),
          ),
          height: 48,
          width: width,
          padding:
              EdgeInsets.only(top: 8, bottom: 8, right: 24, left: leftPadding),
          duration: EdgeBookmarkTab.animationDuration,
          child: Image(image: AssetImage(model.iconPath)),
        ));
  }
}
