part of 'get_chatId_cubit.dart';

@immutable
abstract class GetChatIdState {}

class GetChatIdInitial extends GetChatIdState {}

class GetChatIdLoading extends GetChatIdState {}

class GetChatIdSuccess extends GetChatIdState {
  final String chatId;

  GetChatIdSuccess(this.chatId);
  @override
  // TODO: implement props
  List<Object> get props => [chatId];
}

class GetChatIdFailed extends GetChatIdState {
  final String error;
  GetChatIdFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
