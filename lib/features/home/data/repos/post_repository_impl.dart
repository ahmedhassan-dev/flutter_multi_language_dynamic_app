import '../../data/models/post_model.dart';
import '../../domain/repos/post_repository.dart';
import '../data_sources/post_local_data_source.dart';
import '../data_sources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final posts = await remoteDataSource.getPosts();
      await localDataSource.cachePosts(posts);
      return posts;
    } catch (e) {
      return localDataSource.getCachedPosts();
    }
  }
}
