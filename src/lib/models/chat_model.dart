import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  const ChatModel(
      {required this.chatId, required this.consultanId, required this.userId});

  final String chatId;
  final String consultanId;
  final String userId;

  factory ChatModel.fromJson(String chatId, Map<String, dynamic> json) {
    return ChatModel(
        chatId: chatId,
        consultanId: json['consultanId'],
        userId: json['userId']);
  }

  Map<String, dynamic> toJson() => {
        'consultanId': consultanId,
        'userId': userId,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [chatId, consultanId, userId];
}
