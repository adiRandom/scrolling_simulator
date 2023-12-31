import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/ui/image_constants.dart';

import '../../../domain/services/image_cache.dart';

const _frameCount = 10;
const _baseName = "paper_unfold";

final List<String> unfoldPaperFramePaths = List.generate(_frameCount, (index) {
  return "${ImageConstants.paperUnfoldBasePath}${_baseName}_${index + 1}.png";
});

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
  static const startUnfoldProgressPercentage = 0.7;
  static const moveAnimationStart = 200.0;
  static const moveAnimationEnd = 0.0;

  late AnimationController controller;
  late Animation<double> moveAnimation;
  late Animation<int> frameAnimation;

  List<MemoryImage?> frames = [];
  var isAnimationPlaying = false;

  @override
  void initState() {
    super.initState();

    loadFrames();
    bootstrapAnimations();
  }

  void bootstrapAnimations() {
    controller = AnimationController(
        duration: Duration(
            milliseconds: widget.translateAnimationDuration +
                widget.unfoldAnimationDuration),
        vsync: this);

    var translatePercent = widget.translateAnimationDuration /
        (widget.translateAnimationDuration + widget.unfoldAnimationDuration);

    var startUnfoldAnimation = translatePercent * startUnfoldProgressPercentage;

    // TODO: Begin should be off screen
    // TODO: Adjust offset for unfold start
    moveAnimation = Tween<double>(
            begin: _PaperUnfoldState.moveAnimationStart,
            end: _PaperUnfoldState.moveAnimationEnd)
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0, translatePercent, curve: Curves.linear)));

    frameAnimation = IntTween(begin: 0, end: _frameCount - 1).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(startUnfoldAnimation, 1, curve: Curves.linear)));

    controller.forward();
  }

  void loadFrames() {
    setState(() {
      frames = unfoldPaperFramePaths
          .map((path) => MemoryImageCache().get(path))
          .where((image) => image != null)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (frames.isEmpty) {
      return Container();
    }

    return Positioned.fill(
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) => Transform.translate(
                offset: Offset(0, moveAnimation.value),
                child: Image(
                  image: frames[frameAnimation.value]!,
                  fit: BoxFit.cover,
                ))));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
