import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  const ChatModel(
      {required this.chatId,
      required this.consultantId,
      required this.userId,
      required this.date,
      this.lastMessage = ''});

  final String chatId;
  final String consultantId;
  final String userId;
  final String lastMessage;
  final Timestamp date;

  factory ChatModel.fromJson(String chatId, Map<String, dynamic> json) {
    return ChatModel(
      chatId: chatId,
      lastMessage: json['lastMessage'],
      consultantId: json['consultantId'],
      userId: json['userId'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'consultantId': consultantId,
        'userId': userId,
        'lastMessage': lastMessage,
        'date': date,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [chatId, lastMessage, consultantId, userId];
}
