import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class SkeletonVariant {
  static const triple = 0;
  static const double = 1;
}

class Skeleton extends StatelessWidget {
  final int variant;

  static const skeletonHeight = 16.0;

  const Skeleton({super.key, required this.variant});

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case SkeletonVariant.triple:
        return buildTripleVariant(context);
      case SkeletonVariant.double:
        return buildDoubleVariant(context);
      default:
        return buildTripleVariant(context);
    }
  }

  int getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width.toInt();
  }

  Widget buildTripleVariant(BuildContext context) {
    // Width - left padding - right padding - image margin - image width
    double firstSkeletonWidth = getScreenWidth(context) - 12 - 18 - 16 - 128;

    // Width - left padding - right padding
    double secondSkeletonWidth = getScreenWidth(context) - 12 - 18;

    // Width - left padding - right padding - a bit of offset
    double thirdSkeletonWidth = getScreenWidth(context) - 12 - 18 - 64;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: skeletonHeight,
            width: firstSkeletonWidth,
            decoration: const BoxDecoration(
              color: ThemeColor.auxPostColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            height: skeletonHeight,
            width: secondSkeletonWidth,
            decoration: const BoxDecoration(
              color: ThemeColor.auxPostColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            height: skeletonHeight,
            width: thirdSkeletonWidth,
            decoration: const BoxDecoration(
              color: ThemeColor.auxPostColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDoubleVariant(BuildContext context) {
    // Width - left padding - right padding - image margin - image width
    double firstSkeletonWidth = getScreenWidth(context) - 12 - 18 - 16 - 128;

    // Width - left padding - right padding - a bit of offset
    double secondSkeletonWidth = getScreenWidth(context) - 12 - 18 - 64;

    // Width - left padding - right padding
    double invisibleSkeletonWidth = getScreenWidth(context) - 12 - 18;


    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: skeletonHeight,
            width: firstSkeletonWidth,
            decoration: const BoxDecoration(
              color: ThemeColor.auxPostColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            height: skeletonHeight,
            width: secondSkeletonWidth,
            decoration: const BoxDecoration(
              color: ThemeColor.auxPostColor,
            ),
          ),
          // Invisible for max width
          Container(
            height: 1,
            width: invisibleSkeletonWidth,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
