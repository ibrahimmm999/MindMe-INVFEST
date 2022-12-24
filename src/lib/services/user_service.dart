import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:src/models/article_model.dart';
import 'package:src/models/video_model.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
        'openTime': user.openTime,
        'alamat': user.alamat,
        'resume': user.resume,
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
        role: snapshot['role'],
        resume: snapshot['resume'],
        openTime: snapshot['openTime'],
        alamat: snapshot['alamat'],
      );
    } catch (e) {
      throw e;
    }
  }

  Future<List<UserModel>> fetchConsultans() async {
    try {
      QuerySnapshot result =
          await _userReference.where('role', isEqualTo: 'consultan').get();

      List<UserModel> consultans = result.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        List<ArticleModel> bookmark_articles = [];
        for (var element in data['bookmark_article']) {
          bookmark_articles.add(ArticleModel.fromJson(element['id'], element));
        }

        List<VideoModel> bookmark_videos = [];
        for (var element in data['bookmark_video']) {
          bookmark_videos.add(VideoModel.fromJson(element['id'], element));
        }

        return UserModel(
          id: e.id,
          email: data['email'],
          name: data['name'],
          bookmark_article: bookmark_articles,
          bookmark_video: bookmark_videos,
          username: data['username'],
          isPremium: data['isPremium'],
          photoUrl: data['photoUrl'],
          role: data['role'],
          resume: data['resume'],
          openTime: data['openTime'],
          alamat: data['alamat'],
        );
      }).toList();

      return consultans;
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      List<Map<String, dynamic>> bookmark_articles = [];
      for (var element in user.bookmark_article) {
        bookmark_articles.add(
          element.toJson(),
        );
      }

      List<Map<String, dynamic>> bookmark_videos = [];
      for (var element in user.bookmark_video) {
        bookmark_videos.add(
          element.toJson(),
        );
      }

      DocumentReference docUser =
          _userReference.doc(FirebaseAuth.instance.currentUser!.uid);
      await docUser.update(
        {
          'name': user.name,
          'email': user.email,
          'bookmark_article': bookmark_articles,
          'bookmark_video': bookmark_videos,
          'username': user.username,
          'isPremium': user.isPremium,
          'photoUrl': user.photoUrl,
          'role': user.role,
          'openTime': user.openTime,
          'alamat': user.alamat,
          'resume': user.resume,
        },
      );
    } catch (e) {
      throw e;
    }
  }

  Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);

    Reference storageReference =
        FirebaseStorage.instance.ref('image_profile').child(fileName);

    await storageReference.putFile(imageFile);

    String url = await storageReference.getDownloadURL();

    return url;
  }
}
