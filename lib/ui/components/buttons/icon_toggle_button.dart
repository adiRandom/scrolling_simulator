import 'package:flutter/cupertino.dart';

class IconToggleButton extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  const IconToggleButton(
      {super.key,
      required this.iconPath,
      required this.isSelected,
      required this.selectedColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: isSelected ? selectedColor : null,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            padding: const EdgeInsets.all(6),
            child: Image(image: AssetImage(iconPath), width: 36, height: 36,)));
  }
}
