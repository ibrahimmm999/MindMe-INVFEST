import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'dart:core';

class CommentModel extends Equatable {
  final String id;
  final String senderId;
  final String sender;
  final String text;
  final Timestamp date;

  const CommentModel(
      {required this.id,
      required this.senderId,
      required this.sender,
      required this.text,
      required this.date});

  factory CommentModel.fromJson(String id, Map<String, dynamic> json) {
    return CommentModel(
      id: id,
      senderId: json['senderId'],
      sender: json['sender'],
      text: json['text'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'senderId': senderId,
        'sender': sender,
        'text': text,
        'date': date,
      };

  @override
  List<Object?> get props => [
        id,
        senderId,
        sender,
        text,
        date,
      ];
}
