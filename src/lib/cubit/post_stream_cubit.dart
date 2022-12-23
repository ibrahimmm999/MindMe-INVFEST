import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'post_stream_state.dart';

class PostStreamCubit extends Cubit<PostStreamState> {
  PostStreamCubit() : super(PostStreamInitial());

  void fetchPostStream() {
    try {
      emit(PostStreamLoading());
      Stream<QuerySnapshot> postStream =
          FirebaseFirestore.instance.collection('posts').snapshots();
      emit(PostStreamSuccess(postStream));
    } catch (e) {
      emit(PostStreamFailed(e.toString()));
    }
  }
}
