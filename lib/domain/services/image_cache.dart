import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MemoryImageCache {
  static final MemoryImageCache _instance = MemoryImageCache._internal();

  factory MemoryImageCache() => _instance;

  MemoryImageCache._internal();

  final Map<String, MemoryImage> _cache = {};

  MemoryImage? get(String url) => _cache[url];

  void load(String url) async {
    if (_cache[url] != null) return;

    final bytes = await rootBundle.load(url);
    _cache[url] = MemoryImage(bytes.buffer.asUint8List());
  }

  void loadAll(List<String> urls) async {
    var filteredUrls = urls.where((url) => _cache[url] == null).toList();

    var images =
        await Future.wait(filteredUrls.map((url) => rootBundle.load(url)));
    for (var i = 0; i < filteredUrls.length; i++) {
      var url = filteredUrls[i];
      var image = images[i];

      _cache[url] = MemoryImage(image.buffer.asUint8List());
    }
  }
}
