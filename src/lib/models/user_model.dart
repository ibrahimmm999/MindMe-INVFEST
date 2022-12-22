import 'package:equatable/equatable.dart';
import 'package:src/models/article_model.dart';
import 'package:src/models/video_model.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String role;
  final String username;
  final bool isPremium;
  final String photoUrl;
  final List<ArticleModel> bookmark_article;
  final List<VideoModel> bookmark_video;

  UserModel(
      {required this.id,
      this.role = 'user',
      required this.email,
      required this.name,
      required this.username,
      this.isPremium = false,
      this.photoUrl = '',
      required this.bookmark_article,
      required this.bookmark_video});
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        email,
        name,
        username,
        isPremium,
        photoUrl,
        role,
        bookmark_article,
        bookmark_video
      ];
}
