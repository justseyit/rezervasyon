part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchNewsEvent extends NewsEvent{
  final List<NewsCategory> categories;

  FetchNewsEvent({required this.categories});

  @override
  List<Object?> get props => [];
}
