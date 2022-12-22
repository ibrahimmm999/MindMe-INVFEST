import 'package:equatable/equatable.dart';
import 'package:src/models/video_model.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String fullname;
  final String role;
  final String username;
  final bool isPremium;
  final String photoUrl;
  final Map bookmark_article;
  final List<VideoModel> bookmark_video;

  UserModel(
      {required this.id,
      required this.role,
      required this.email,
      required this.fullname,
      required this.username,
      required this.isPremium,
      this.photoUrl = '',
      required this.bookmark_article,
      required this.bookmark_video});
  @override
  // TODO: implement props
  List<Object?> get props => [id, email, fullname, username, isPremium];
}
