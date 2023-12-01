import 'package:flutter/material.dart';

class SizedSwitch extends StatelessWidget {
  final bool isSelected;
  final Function(bool) onTap;
  final double? width;
  final double? height;
  final MaterialStateColor? thumbColor;
  final Color? activeColor;
  final Color? inactiveTrackColor;

  const SizedSwitch(
      {super.key,
      required this.isSelected,
      required this.onTap,
      this.width,
      this.height,
      this.thumbColor,
      this.activeColor,
      this.inactiveTrackColor});

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
                    value: isSelected,
                    onChanged: (value) {
                      onTap(value);
                    },
                    thumbColor: thumbColor,
                    inactiveTrackColor: inactiveTrackColor,
                    activeColor: activeColor))));
  }
}
