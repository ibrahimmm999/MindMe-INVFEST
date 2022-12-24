import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:src/ui/user_pages/articles_page.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  void fetchArticles() async {
    try {
      emit(ArticleLoading());
      List<ArticleModel> article = await ArticleService().fetchArticles();
      //print(article);
      emit(ArticleSuccess(article));
    } catch (e) {
      emit(ArticleFailed(e.toString()));
    }
  }
}
