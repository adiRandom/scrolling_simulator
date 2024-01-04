import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/extensions/list_extensions.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../data/types.dart';

class InfiniteList<T> extends StatefulWidget {
  final Future<PaginatedData<T>> Function(int page) pageRequest;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final int threshold;

  const InfiniteList(
      {super.key,
      required this.pageRequest,
      required this.itemBuilder,
      required this.threshold});

  @override
  State<StatefulWidget> createState() => _InfiniteListState<T>();
}

class _InfiniteListState<T> extends State<InfiniteList<T>> {
  int currentPage = 0;

  List<PaginatedData<T>> pages = [];
  List<T> get data => pages.map((e) => e.data).toList().flatten();
  bool get hasMore => currentPage + 1 < pages.first.totalPages;

  @override
  void initState() {
    super.initState();
    fetchPage(0);
  }

  void fetchPage(int page) async {
    final newPage = await widget.pageRequest(page);
    setState(() {
      pages.add(newPage);
    });
  }

  void loadNextPage() async {
    if (!hasMore) {
      developer.log("No more pages to load");
      return;
    }

    fetchPage(currentPage + 1);
    developer.log("Loading page ${currentPage + 1}");
    setState(() {
      currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          if (index == data.length - widget.threshold) {
            developer.log("Load more $index");
            return VisibilityDetector(
              key: const Key("load-more"),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0) {
                  loadNextPage();
                }
              },
              child: widget.itemBuilder(context, data[index]),
            );
          }

          return Container(child: widget.itemBuilder(context, data[index]));
        });
  }
}
