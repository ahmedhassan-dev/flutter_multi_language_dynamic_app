import 'dart:convert';
import '../../../../core/local_storage/Prefs.dart';
import '../../data/models/post_model.dart';

class PostLocalDataSource {
  Future<void> cachePosts(List<PostModel> posts) async {
    final postsJson = jsonEncode(posts.map((post) => post.toJson()).toList());
    await Prefs.setString('cached_posts', postsJson);
  }

  Future<List<PostModel>> getCachedPosts() async {
    final postsJson = Prefs.getString('cached_posts');
    if (postsJson != null) {
      final List<dynamic> jsonList = jsonDecode(postsJson);
      return jsonList.map((json) => PostModel.fromJson(json)).toList();
    }
    return [];
  }
}
