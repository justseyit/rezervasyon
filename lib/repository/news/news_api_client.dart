import 'package:rezervasyon/models/news.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NewsAPIClient {
  static const String baseURL = 'https://www.rezervasyon.com/fluttercat/';
  final Client client = Client();

  Future<List<News>> getNews(String category) async {
    List<News> news = [];
    final String categoryURL = baseURL + category;
    final Response response = await get(Uri.parse(categoryURL));

    final List fetchedJSON = jsonDecode(response.body) as List;

    for (Map<String, dynamic> map in fetchedJSON) {
      news.add(News.fromMap(map));
    }
    return news;
  }
}
