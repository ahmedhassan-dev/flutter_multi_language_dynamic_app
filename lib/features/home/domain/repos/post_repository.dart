import '../../data/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}
