import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_simulator/theme/text_style.dart';

class Author extends StatelessWidget {
  final String username;
  final String image;

  const Author({
    super.key,
    required this.username,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundImage: NetworkImage(image),
        ),
        Container(
            margin: const EdgeInsets.only(left: 8),
            child: Text("@$username", style: ThemeTextStyle.subtitleTextStyle)),
      ],
    );
  }
}
