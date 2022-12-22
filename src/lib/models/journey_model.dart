import 'package:equatable/equatable.dart';

class JourneyModel extends Equatable {
  final String id;
  final String imageUrl;
  final String title;
  final String content;
  final String date;
  JourneyModel({
    required this.id,
    this.title = '',
    this.content = '',
    this.imageUrl = '',
    this.date = '',
  });

  factory JourneyModel.fromJson(String id, Map<String, dynamic> json) =>
      JourneyModel(
        id: id,
        title: json['title'],
        content: json['content'],
        imageUrl: json['imageUrl'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'imageUrl': imageUrl,
        'date': date,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, content, imageUrl, date];
}
