extension NestedListExtensions<T> on List<List<T>> {
  List<T> flatten() {
    return expand((e) => e).toList();
  }
}

extension JsonListExtensions on List<dynamic> {
  List<T> decodeList<T>(T Function(dynamic) bodyDecoder) {
    if (this is! List) {
      throw Exception('Invalid response body');
    }

    var list = List<T>.empty(growable: true);
    forEach((e) => list.add(bodyDecoder(e)));
    return list;
  }
}
