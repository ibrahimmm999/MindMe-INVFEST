part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<PostModel> posts;

  PostSuccess(this.posts);
  @override
  // TODO: implement props
  List<Object> get props => [posts];
}

class PostFailed extends PostState {
  final String error;
  PostFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
