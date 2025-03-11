import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/post_model.dart';
import '../../../domain/repos/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository postRepository;

  PostCubit(this.postRepository) : super(PostInitial());

  Future<void> getPosts() async {
    emit(PostLoading());
    try {
      final posts = await postRepository.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError('Failed to load posts'));
    }
  }
}
