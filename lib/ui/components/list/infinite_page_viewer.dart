import 'package:flutter/cupertino.dart';
import 'package:scrolling_simulator/ui/components/list/types.dart';

import '../../../data/types.dart';
import 'infinite_list.dart';

class InfinitePageViewer<T> extends StatelessWidget {
  final Future<PaginatedData<T>> Function(int page) pageRequest;
  final ItemBuilder<T> itemBuilder;
  final int threshold;

  final PageController _controller = PageController();

  InfinitePageViewer(
      {super.key,
      required this.pageRequest,
      required this.itemBuilder,
      required this.threshold});

  Widget buildHostList(ItemBuilderWithIndex itemBuilder, List<T> data) {
    return PageView.builder(
      itemCount: data.length,
      itemBuilder: itemBuilder,
      controller: _controller,
      scrollDirection: Axis.vertical,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InfiniteList(
      pageRequest: pageRequest,
      itemBuilder: itemBuilder,
      threshold: threshold,
      hostListBuilder: buildHostList,
    );
  }
}
