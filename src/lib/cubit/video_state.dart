part of 'video_cubit.dart';

abstract class VideoState {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoSuccess extends VideoState {
  final List<VideoModel> videos;

  VideoSuccess(this.videos);
  @override
  // TODO: implement props
  List<Object> get props => [videos];
}

class VideoFailed extends VideoState {
  final String error;
  VideoFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
