import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/models/news_category.dart';
import 'package:rezervasyon/repository/news/news_api_client.dart';
import 'package:rezervasyon/services/news_scraping/news_scraping_base.dart';

import '../../service_locator.dart';

class NewsScrapingService implements NewsScrapingBase {
  final NewsAPIClient _newsAPIClient = locator<NewsAPIClient>();
  @override
  Future<List<News>> getNews(NewsCategory newsCategory) async {
    return await _newsAPIClient.getNews(newsCategory.code);
  }
}
