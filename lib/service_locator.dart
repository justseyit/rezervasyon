import 'package:rezervasyon/repository/corner_post/corner_post_api_client.dart';
import 'package:rezervasyon/repository/corner_post/corner_post_repository.dart';
import 'package:rezervasyon/repository/enum.dart';
import 'package:rezervasyon/repository/news/news_api_client.dart';
import 'package:rezervasyon/repository/news/news_repository.dart';
import 'package:rezervasyon/services/corner_post_scraping/corner_post_scraping.dart';
import 'package:rezervasyon/services/corner_post_scraping/fake_corner_post_scraping.dart';
import 'package:rezervasyon/services/news_scraping/fake_news_scraping.dart';
import 'package:rezervasyon/services/news_scraping/news_scraping.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FakeNewsScrapingService());
  locator.registerLazySingleton(() => NewsScrapingService());
  locator.registerLazySingleton(() => NewsRepository(appMode: AppMode.Debug));
  locator.registerLazySingleton(() => FakeCornerPostScrapingService());
  locator.registerLazySingleton(() => CornerPostScrapingService());
  locator.registerLazySingleton(() => CornerPostRepository(appMode: AppMode.Release));
  locator.registerLazySingleton(() => CornerPostAPIClient());
  locator.registerLazySingleton(() => NewsAPIClient());
}
