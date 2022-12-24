import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class JourneyModel extends Equatable {
  final String id;
  final String id_user;
  final String imageUrl;
  final String title;
  final String content;
  final Timestamp date;
  JourneyModel(
      {required this.id,
      this.title = '',
      this.content = '',
      this.imageUrl = '',
      required this.date,
      required this.id_user});

  factory JourneyModel.fromJson(String id, Map<String, dynamic> json) =>
      JourneyModel(
        id: id,
        title: json['title'],
        content: json['content'],
        imageUrl: json['imageUrl'],
        date: json['date'],
        id_user: json['id_user'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_user': id_user,
        'title': title,
        'content': content,
        'imageUrl': imageUrl,
        'date': date,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, content, imageUrl, date, id_user];
}
