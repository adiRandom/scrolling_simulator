import 'dart:convert';

import 'package:http/http.dart' as http;

import '../types.dart';

class ApiClient {
  static const String baseUrl = 'https://scroll.randomhub.eu/api/';

  static final ApiClient _instance = ApiClient._internal();

  ApiClient._internal();

  Future<ApiResponse<T>> get<T>(
      String endpoint, T Function(dynamic) bodyDecoder) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint));
    final json = jsonDecode(response.body);
    return ApiResponse.fromJson(json, bodyDecoder);
  }

  List<T> decodeList<T>(dynamic json, T Function(dynamic) bodyDecoder) {
    if (json is! List) {
      throw Exception('Invalid response body');
    }
    return json.map((e) => bodyDecoder(e)).toList();
  }

  factory ApiClient() {
    return _instance;
  }
}
