import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/ui/image_constants.dart';

class PaperUnfold extends StatefulWidget {
  final int unfoldAnimationDuration;
  final int translateAnimationDuration;

  const PaperUnfold(
      {super.key,
      this.unfoldAnimationDuration = 1000,
      this.translateAnimationDuration = 1000});

  @override
  State<StatefulWidget> createState() {
    return _PaperUnfoldState();
  }
}

class _PaperUnfoldState extends State<PaperUnfold>
    with TickerProviderStateMixin {
  static const baseName = "paper_unfold";
  static const frameCount = 10;
  static const startUnfoldOffset = 100;

  late AnimationController controller;
  late Animation<double> moveAnimation;

  late Duration frameDuration;
  late List<String> imagePaths = List.generate(frameCount, (index) {
    return "${ImageConstants.paperUnfoldBasePath}${baseName}_${index + 1}.png";
  });

  int currentFrame = 0;
  var isAnimationPlaying = false;

  @override
  void initState() {
    super.initState();
    frameDuration =
        Duration(milliseconds: widget.unfoldAnimationDuration ~/ frameCount);

    controller = AnimationController(
        duration: Duration(milliseconds: widget.translateAnimationDuration),
        vsync: this);

    // TODO: Begin should be off screen
    // TODO: Adjust offset for unfold start
    moveAnimation = Tween<double>(begin: 200, end: 0).animate(controller)
      ..addListener(() {
        if (moveAnimation.value <= startUnfoldOffset) {
          playUnfoldingAnimation();
        }

        setState(() {});
      });

    controller.forward();
    //
    // playAnimation();
  }

  void preloadFrames() async {
    for (int i = 0; i < frameCount; i++) {
      final image = AssetImage(imagePaths[i]);
      precacheImage(image, context);
    }
  }

  void playUnfoldingAnimation() async {
    if (isAnimationPlaying) {
      return;
    }

    isAnimationPlaying = true;
    while (currentFrame < frameCount - 1) {
      // Use a condition to control the loop
      await Future.delayed(frameDuration); // Control frame rate
      setState(() {
        currentFrame++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      for (int i = 0; i < frameCount; i++)
        Positioned.fill(
            child: Transform.translate(
                offset: Offset(0, moveAnimation.value),
                child: Opacity(
                    opacity: i == currentFrame ? 1 : 0,
                    child: Image.asset(
                      imagePaths[i],
                      fit: BoxFit.cover,
                    ))))
    ]);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
