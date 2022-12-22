import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/video_model.dart';
import '../services/video_service.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  void fetchVideos() async {
    try {
      emit(VideoLoading());
      List<VideoModel> video = await VideoService().fetchVideos();
      print(video);
      emit(VideoSuccess(video));
    } catch (e) {
      emit(VideoFailed(e.toString()));
    }
  }
}
