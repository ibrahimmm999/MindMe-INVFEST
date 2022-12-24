import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'comment_model..dart';

class PostModel extends Equatable {
  final String id;
  final String authorId;
  final String imageUrl;
  final String author;
  final Timestamp date;
  final String content;
  final List<CommentModel> comments;
  const PostModel(
      {this.id = '',
      this.imageUrl = '',
      this.author = '',
      required this.authorId,
      this.content = '',
      required this.date,
      required this.comments});

  factory PostModel.fromJson(String id, Map<String, dynamic> json) {
    List<CommentModel> comments = [];
    for (var element in json['comments']) {
      comments.add(CommentModel.fromJson(element['id'], element));
    }

    return PostModel(
      id: id,
      authorId: json['authorId'],
      imageUrl: json['imageUrl'],
      author: json['author'],
      content: json['content'],
      date: json['date'],
      comments: comments,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'author': author,
        'authorId': authorId,
        'content': content,
        'date': date,
        'comments': comments.map((comment) {
          comment.toJson();
        }),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        imageUrl,
        content,
        author,
        authorId,
        date,
        comments,
      ];
}
