import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/models/news_category.dart';
import 'package:rezervasyon/service_locator.dart';
import 'package:rezervasyon/services/news_scraping/fake_news_scraping.dart';
import 'package:rezervasyon/services/news_scraping/news_scraping.dart';

import '../enum.dart';

class NewsRepository {
  final FakeNewsScrapingService _fakeScrapingService = locator<FakeNewsScrapingService>();
  final NewsScrapingService _newsScrapingService = locator<NewsScrapingService>();

  final AppMode appMode;

  NewsRepository({required this.appMode});

  Future<List<News>> getNews({required NewsCategory newsCategory}) async {
    if (appMode == AppMode.Debug) {
      return await _fakeScrapingService.getNews(newsCategory);
    } else {
      return await _newsScrapingService.getNews(newsCategory);
    }
  }
}
