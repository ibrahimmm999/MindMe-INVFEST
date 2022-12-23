import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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

  void addComment(PostModel post) async {
    try {
      emit(PostLoading());
      await PostService().addComments(post);
    } catch (e) {
      emit(PostFailed(e.toString()));
    }
  }
}
