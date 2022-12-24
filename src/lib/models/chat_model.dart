import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  const ChatModel(
      {required this.chatId,
      required this.consultantId,
      required this.userId,
      this.lastMessage = ''});

  final String chatId;
  final String consultantId;
  final String userId;
  final String lastMessage;

  factory ChatModel.fromJson(String chatId, Map<String, dynamic> json) {
    return ChatModel(
      chatId: chatId,
      lastMessage: json['lastMessage'],
      consultantId: json['consultantId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'consultantId': consultantId,
        'userId': userId,
        'lastMessage': lastMessage,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [chatId, lastMessage, consultantId, userId];
}
