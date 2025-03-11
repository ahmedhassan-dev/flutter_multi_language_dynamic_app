import 'package:dio/dio.dart';
import 'package:flutter_multi_language_dynamic_app/core/functions/service_locator.dart';
import '../../data/models/post_model.dart';

class PostRemoteDataSource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await getIt<Dio>().get(baseUrl);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load posts: ${e.message}');
    }
  }
}
