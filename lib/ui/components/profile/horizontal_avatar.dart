import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_simulator/theme/text_style.dart';

class HorizontalAvatar extends StatelessWidget {
  final String username;
  final String image;

  const HorizontalAvatar({
    super.key,
    required this.username,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(image), 
        ),
        Container(
            margin: const EdgeInsets.only(left: 8),
            child: Text("@$username", style: ThemeTextStyle.lektonItalic22)),
      ],
    );
  }
}
