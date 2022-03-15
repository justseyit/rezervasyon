import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/models/news_category.dart';

import 'news_scraping_base.dart';

class FakeNewsScrapingService implements NewsScrapingBase {
  @override
  Future<List<News>> getNews(NewsCategory category) async {
    List<News> news = [];
    for (int i = 0; i < 35; i++) {
      news.add(News(
        id: '$i',
        title: 'Fake News Title $i',
        newshit: '$i',
        description: 'Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. ',
        urlToImage: 'https://g.foolcdn.com/editorial/images/618711/arrow-angles-up-on-a-green-stock-chart.jpg',
        publshedAt: DateTime.now(),
        content: 'Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. Fake news content. ',
        articleUrl: 'http://dfşjkşjfdş.gffdg',
      ));
    }
    return await Future.delayed(Duration(milliseconds: 500), () {
      return news;
    });
  }
}
