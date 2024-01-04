import 'package:flutter/cupertino.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext context, T item);
typedef ItemBuilderWithIndex<T> = Widget Function(
    BuildContext context, int index);
