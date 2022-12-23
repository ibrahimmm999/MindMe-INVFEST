part of 'article_cubit.dart';

abstract class ArticleState {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
  final List<ArticleModel> articles;

  ArticleSuccess(this.articles);
  @override
  // TODO: implement props
  List<Object> get props => [articles];
}

class ArticleFailed extends ArticleState {
  final String error;
  ArticleFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
