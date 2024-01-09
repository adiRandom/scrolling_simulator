import 'package:scrolling_simulator/data/types.dart';
import 'package:scrolling_simulator/domain/models/post.dart';

import '../api/feed.dart';

class PostRepository {
  static const postsPerPage = 10;
  static final PostRepository _singleton = PostRepository._internal();
  final FeedApi postApiClient = FeedApi();

  PostRepository._internal();

  factory PostRepository() {
    return _singleton;
  }

  Future<PaginatedData<PostModel>> getPostsPage() async {
    final response = await postApiClient.getPosts(postsPerPage);
    if (response.success) {
      return response.data!.map((post) => PostModel.fromDto(post));
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
