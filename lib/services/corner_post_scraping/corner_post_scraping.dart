import 'package:rezervasyon/models/corner_post.dart';
import 'package:rezervasyon/repository/corner_post/corner_post_api_client.dart';
import 'package:rezervasyon/service_locator.dart';
import 'package:rezervasyon/services/corner_post_scraping/corner_post_scraping_base.dart';

class CornerPostScrapingService implements CornerPostScrapingBase {
  final CornerPostAPIClient _cornerPostAPIClient = locator<CornerPostAPIClient>();

  @override
  Future<List<CornerPost>> getCornerPosts() async {
    return await _cornerPostAPIClient.getCornerPosts();
  }
}
