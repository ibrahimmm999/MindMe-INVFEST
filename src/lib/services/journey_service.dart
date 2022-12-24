import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/journey_model.dart';
import 'dart:io';
import 'package:path/path.dart';

class JourneyService {
  CollectionReference _journeysReference =
      FirebaseFirestore.instance.collection('journey');
  Future<List<JourneyModel>> fetchJourneys() async {
    try {
      QuerySnapshot result = await _journeysReference.get();
      List<JourneyModel> journeys = result.docs.map((e) {
        return JourneyModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return journeys;
    } catch (e) {
      throw e;
    }
  }

  Future<JourneyModel> getJourneyById(String id) async {
    try {
      DocumentSnapshot snapshot = await _journeysReference.doc(id).get();
      return JourneyModel(
          id: id,
          title: snapshot['title'],
          id_user: snapshot['id_user'],
          content: snapshot['content'],
          date: snapshot['date']);
    } catch (e) {
      throw e;
    }
  }

  Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);

    Reference storageReference =
        FirebaseStorage.instance.ref('image_journey').child(fileName);

    await storageReference.putFile(imageFile);

    String url = await storageReference.getDownloadURL();

    return url;
  }
}
