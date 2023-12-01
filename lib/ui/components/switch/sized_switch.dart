import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizedSwitch extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final MaterialStateColor? thumbColor;
  final Color? activeColor;

  const SizedSwitch(
      {super.key,
      required this.isSelected,
      required this.onTap,
      this.width,
      this.height,
      this.thumbColor,
      this.activeColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 42,
        height: 32,
        child: FittedBox(
            fit: BoxFit.contain,
            child: Material(
                color: Colors.transparent,
                child: Switch(
                    value: true,
                    onChanged: (value) {},
                    thumbColor: thumbColor,
                    activeColor: activeColor))));
  }
}
