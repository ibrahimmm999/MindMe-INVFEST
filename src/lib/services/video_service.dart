import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/video_model.dart';

class VideoService {
  CollectionReference _videosReference =
      FirebaseFirestore.instance.collection('videos');
  Future<List<VideoModel>> fetchVideos() async {
    try {
      QuerySnapshot result = await _videosReference.get();
      List<VideoModel> videos = result.docs.map((e) {
        return VideoModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return videos;
    } catch (e) {
      throw e;
    }
  }

  Future<VideoModel> getVideoById(String id) async {
    try {
      DocumentSnapshot snapshot = await _videosReference.doc(id).get();
      return VideoModel(
          id: id,
          title: snapshot['title'],
          date: snapshot['date'],
          thumbnail: snapshot['thumbnail'],
          uploader: snapshot['uploader'],
          videoUrl: snapshot['videoUrl']);
    } catch (e) {
      throw e;
    }
  }
}
