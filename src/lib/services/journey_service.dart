import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/journey_model.dart';

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
        content: snapshot['content'],
      );
    } catch (e) {
      throw e;
    }
  }
}