import 'package:flutter/material.dart';

class DynamicFadeList extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final int threshold;
  final List<double> stops;

  const DynamicFadeList(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      this.threshold = 0,
      this.stops = const [0.0, 0.2, 0.7, 1.0]});

  @override
  State<DynamicFadeList> createState() => _DynamicFadeListState();
}

class _DynamicFadeListState extends State<DynamicFadeList> {
  final ScrollController _scrollController = ScrollController();
  bool _isTop = true;
  bool _isBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - widget.threshold &&
        !_scrollController.position.outOfRange) {
      if (!_isBottom) {
        setState(() {
          _isBottom = true;
        });
      }
    } else {
      if (_isBottom) {
        setState(() {
          _isBottom = false;
        });
      }
    }

    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent + widget.threshold &&
        !_scrollController.position.outOfRange) {
      if (!_isTop) {
        setState(() {
          _isTop = true;
        });
      }
    } else {
      if (_isTop) {
        setState(() {
          _isTop = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            _isTop ? Colors.black : Colors.transparent,
            Colors.black,
            Colors.black,
            _isBottom ? Colors.black : Colors.transparent
          ],
          stops: widget.stops,
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          _scrollListener();
          return true;
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.itemCount, // Adjust number of items as needed
          itemBuilder: widget.itemBuilder,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}
