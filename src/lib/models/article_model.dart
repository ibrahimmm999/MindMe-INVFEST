import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ArticleModel extends Equatable {
  final String id;
  final String title;
  final String thumbnail;
  final String author;
  final String date;
  final String content;
  ArticleModel(
      {this.id = '',
      this.thumbnail = '',
      this.title = '',
      this.author = '',
      this.content = '',
      this.date = ""});

  factory ArticleModel.fromJson(String id, Map<String, dynamic> json) =>
      ArticleModel(
        id: id,
        thumbnail: json['thumbnail'],
        title: json['title'],
        author: json['author'],
        content: json['content'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'thumbnail': thumbnail,
        'title': title,
        'author': author,
        'content': content,
        'date': date,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        thumbnail,
        title,
        content,
        author,
        date,
      ];
}
