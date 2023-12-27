import 'package:flutter/cupertino.dart';

import '../../../theme/text_style.dart';
import 'asset_toggle_button.dart';

class LabelAssetToggleButton extends StatelessWidget {
  final String label;

  final bool isSelected;
  final String iconPath;
  final String selectedIconPath;
  final double iconSize;
  final VoidCallback onTap;

  LabelAssetToggleButton(
      {super.key,
      required this.isSelected,
      required this.iconPath,
      required this.selectedIconPath,
      required this.iconSize,
      required this.onTap,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AssetToggleButton(
            isSelected: isSelected,
            iconPath: iconPath,
            selectedIconPath: selectedIconPath,
            iconSize: iconSize,
            onTap: onTap),
        Text(label, style: ThemeTextStyle.lektonBold16)
      ],
    );
  }
}
