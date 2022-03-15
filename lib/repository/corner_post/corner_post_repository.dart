import 'package:rezervasyon/models/corner_post.dart';
import 'package:rezervasyon/service_locator.dart';
import 'package:rezervasyon/services/corner_post_scraping/corner_post_scraping.dart';
import 'package:rezervasyon/services/corner_post_scraping/fake_corner_post_scraping.dart';

import '../enum.dart';

class CornerPostRepository {
  final AppMode appMode;

  CornerPostRepository({required this.appMode});

  final FakeCornerPostScrapingService _fakeCornerPostScrapingService = locator<FakeCornerPostScrapingService>();
  final CornerPostScrapingService _cornerPostScrapingService = locator<CornerPostScrapingService>();

  Future<List<CornerPost>?> getCornerPosts() async {
    if (appMode == AppMode.Debug) {
      return await _fakeCornerPostScrapingService.getCornerPosts();
    } else {
      return await _cornerPostScrapingService.getCornerPosts();
    }
  }
}
