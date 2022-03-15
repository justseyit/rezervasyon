import 'package:rezervasyon/models/corner_post.dart';

abstract class CornerPostScrapingBase {
  Future<List<CornerPost>> getCornerPosts();
}
