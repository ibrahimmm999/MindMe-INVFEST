import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/article_model.dart';

class ArticleService {
  CollectionReference _articlesReference =
      FirebaseFirestore.instance.collection('articles');
  Future<List<ArticleModel>> fetchArticles() async {
    try {
      QuerySnapshot result = await _articlesReference.get();
      List<ArticleModel> articles = result.docs.map((e) {
        return ArticleModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return articles;
    } catch (e) {
      throw e;
    }
  }

  Future<ArticleModel> getArticleById(String id) async {
    try {
      DocumentSnapshot snapshot = await _articlesReference.doc(id).get();
      return ArticleModel(
          id: id,
          title: snapshot['title'],
          date: snapshot['date'],
          thumbnail: snapshot['thumbnail'],
          author: snapshot['author'],
          content: snapshot['content']);
    } catch (e) {
      throw e;
    }
  }
}
