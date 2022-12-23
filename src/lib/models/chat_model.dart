import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  const ChatModel(
      {required this.chatId,
      required this.consultanId,
      required this.userId,
      this.lastMessage = ''});

  final String chatId;
  final String consultanId;
  final String userId;
  final String lastMessage;

  factory ChatModel.fromJson(String chatId, Map<String, dynamic> json) {
    return ChatModel(
        chatId: chatId,
        lastMessage: json['lastMessage'],
        consultanId: json['consultanId'],
        userId: json['userId']);
  }

  Map<String, dynamic> toJson() => {
        'consultanId': consultanId,
        'userId': userId,
        'lastMessage': lastMessage,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [chatId, lastMessage, consultanId, userId];
}
