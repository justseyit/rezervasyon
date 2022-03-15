part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class InitialNewsState extends NewsState {
  @override
  List<Object> get props => [];
}

class FetchedNewsState extends NewsState {
  final Map<NCategory, List<News>> news;

  FetchedNewsState({required this.news}) {
    news.forEach((nCategory, newsList) {
      /*for(News news in newsList){

      }*/
    });
  }

  @override
  List<Object?> get props => [this.news];
}

class FetchingNewsState extends NewsState {
  @override
  List<Object?> get props => [];
}

class CantFetchNewsState extends NewsState {
  final Object exception;

  CantFetchNewsState({required this.exception});

  @override
  List<Object?> get props => [this.exception];
}
