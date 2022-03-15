import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/models/news_category.dart';
import 'package:rezervasyon/repository/news/news_repository.dart';
import 'package:equatable/equatable.dart';

import '../../service_locator.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(InitialNewsState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    final NewsRepository nr = locator<NewsRepository>();
    if (event is FetchNewsEvent) {
      try {
        yield FetchingNewsState();
        Map<NCategory, List<News>> news = {};
        for (NewsCategory ncategory in event.categories) {
          news[ncategory.category] = await nr.getNews(newsCategory: ncategory);
        }
        yield FetchedNewsState(news: news);
      } catch (e) {
        yield CantFetchNewsState(exception: e);
      }
    }
  }
}
