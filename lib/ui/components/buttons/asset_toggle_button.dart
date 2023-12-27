import 'package:flutter/cupertino.dart';

class AssetToggleButton extends StatelessWidget {
  final bool isSelected;
  final String iconPath;
  final String selectedIconPath;
  final double iconSize;
  final VoidCallback onTap;

  AssetImage regularImage;
  AssetImage selectedImage;

  AssetToggleButton(
      {super.key,
      required this.isSelected,
      required this.iconPath,
      required this.selectedIconPath,
      required this.iconSize,
      required this.onTap})
      : regularImage = AssetImage(iconPath),
        selectedImage = AssetImage(selectedIconPath);

  @override
  Widget build(BuildContext context) {
    precacheImage(regularImage, context);
    precacheImage(selectedImage, context);

    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(6),
            child: Image(
              image: !isSelected ? regularImage : selectedImage,
              width: iconSize,
              height: iconSize,
            )));
  }
}
