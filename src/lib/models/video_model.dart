import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class VideoModel extends Equatable {
  final String id;
  final String title;
  final String thumbnail;
  final String uploader;
  final Timestamp date;
  final String videoUrl;
  VideoModel(
      {this.id = '',
      this.thumbnail = '',
      this.title = '',
      this.uploader = '',
      this.videoUrl = '',
      required this.date});

  factory VideoModel.fromJson(String id, Map<String, dynamic> json) =>
      VideoModel(
        id: id,
        thumbnail: json['thumbnail'],
        title: json['title'],
        uploader: json['uploader'],
        videoUrl: json['videoUrl'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'thumbnail': thumbnail,
        'title': title,
        'uploader': uploader,
        'videoUrl': videoUrl,
        'date': date,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        thumbnail,
        title,
        videoUrl,
        uploader,
        date,
      ];
}
