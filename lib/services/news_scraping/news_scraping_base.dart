import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/models/news_category.dart';

abstract class NewsScrapingBase {
  Future<List<News>> getNews(NewsCategory newsCategory);
}
