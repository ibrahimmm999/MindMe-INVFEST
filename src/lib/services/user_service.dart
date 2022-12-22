import 'package:src/models/article_model.dart';
import 'package:src/models/video_model.dart';

import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');
  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'bookmark_article': user.bookmark_article,
        'bookmark_video': user.bookmark_video,
        'username': user.username,
        'isPremium': user.isPremium,
        'photoUrl': user.photoUrl,
        'role': user.role,
      });
    } catch (e) {
      throw e;
    }
  }

  // Membuat data user menjadi dinamis
  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();

      List<ArticleModel> bookmark_articles = [];
      for (var element in snapshot['bookmark_article']) {
        bookmark_articles.add(ArticleModel.fromJson(element['id'], element));
      }

      List<VideoModel> bookmark_videos = [];
      for (var element in snapshot['bookmark_video']) {
        bookmark_videos.add(VideoModel.fromJson(element['id'], element));
      }

      return UserModel(
          id: id,
          email: snapshot['email'],
          name: snapshot['name'],
          bookmark_article: bookmark_articles,
          bookmark_video: bookmark_videos,
          username: snapshot['username'],
          isPremium: snapshot['isPremium'],
          photoUrl: snapshot['photoUrl'],
          role: snapshot['role']);
    } catch (e) {
      throw e;
    }
  }
}
