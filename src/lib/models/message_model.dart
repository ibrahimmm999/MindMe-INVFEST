import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MessageModel extends Equatable {
  const MessageModel(
      {required this.messageId,
      required this.date,
      required this.receiverId,
      required this.senderId,
      required this.text});

  final String messageId;
  final Timestamp date;
  final String receiverId;
  final String senderId;
  final String text;

  factory MessageModel.fromJson(String messageId, Map<String, dynamic> json) {
    return MessageModel(
      messageId: messageId,
      date: json['date'],
      receiverId: json['receiverId'],
      senderId: json['senderId'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'receiverId': receiverId,
        'senderId': senderId,
        'text': text,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [messageId, receiverId, senderId, date, text];
}
