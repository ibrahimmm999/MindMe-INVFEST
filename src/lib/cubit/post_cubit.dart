import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:src/services/post_service.dart';

import '../models/post_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  void fetchPosts() async {
    try {
      emit(PostLoading());
      List<PostModel> post = await PostService().fetchPosts();
      emit(PostSuccess(post));
    } catch (e) {
      emit(PostFailed(e.toString()));
    }
  }
}
