import 'package:rezervasyon/models/news_category.dart';

class Constants {
  static final List<NewsCategory> categories = [
    NewsCategory(category: NCategory.Sport),
    NewsCategory(category: NCategory.Journal),
    NewsCategory(category: NCategory.Politics),
    NewsCategory(category: NCategory.Economy),
    NewsCategory(category: NCategory.World),
    NewsCategory(category: NCategory.Magazine),
    NewsCategory(category: NCategory.Technology),
  ];
}
