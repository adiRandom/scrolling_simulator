import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/domain/services/image_cache.dart';
import 'package:scrolling_simulator/ui/components/buttons/asset_toggle_button.dart';
import 'package:scrolling_simulator/ui/image_constants.dart';
import 'package:scrolling_simulator/ui/screens/nav/navigation_screen.dart';
import 'package:scrolling_simulator/ui/screens/nav/paper_unfold.dart';

class RootScreen extends StatefulWidget {
  final Widget child;

  const RootScreen({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool isNavScreenOpen = false;

  void onNavToggle() {
    setState(() {
      isNavScreenOpen = !isNavScreenOpen;
    });
  }

  void onNavPerformed() {
    setState(() {
      isNavScreenOpen = false;
    });
  }

  @override
  initState() {
    super.initState();

    MemoryImageCache().loadAll(unfoldPaperFramePaths);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          widget.child,
          if (isNavScreenOpen)
            NavigationScreen(
              onNavAway: onNavPerformed,
            ),
          Positioned.fill(
              bottom: 16,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AssetToggleButton(
                      isSelected: isNavScreenOpen,
                      iconPath: ImageConstants.compassButton,
                      selectedIconPath: ImageConstants.compassButtonPressed,
                      iconSize: 96,
                      onTap: onNavToggle)))
        ],
      ),
    );
  }
}
