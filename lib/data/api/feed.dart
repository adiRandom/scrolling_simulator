import 'package:scrolling_simulator/data/dto/post.dart';

import '../types.dart';
import 'client.dart';

class FeedApi {
  final ApiClient _client = ApiClient();

  static const baseUrl = 'posts';

  Future<ApiResponse<PaginatedData<PostDto>>> getPosts(int limit) async {
    final response = await _client.get(
        '$baseUrl?limit=$limit',
        (bodyJson) => PaginatedData.fromJson(
            bodyJson, (jsonBody) => PostDto.fromJSON(jsonBody)));

    return response;
  }
}
