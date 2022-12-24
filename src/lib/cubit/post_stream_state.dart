part of 'post_stream_cubit.dart';

@immutable
abstract class PostStreamState {}

class PostStreamInitial extends PostStreamState {}

class PostStreamLoading extends PostStreamState {}

class PostStreamSuccess extends PostStreamState {
  final Stream<QuerySnapshot> postStream;

  PostStreamSuccess(this.postStream);
  @override
  // TODO: implement props
  List<Object> get props => [postStream];
}

class PostStreamFailed extends PostStreamState {
  final String error;
  PostStreamFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
