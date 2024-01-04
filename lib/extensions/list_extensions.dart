extension NestedListExtensions<T> on List<List<T>> {
  List<T> flatten() {
    return expand((e) => e).toList();
  }
}
