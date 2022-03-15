import 'package:rezervasyon/models/corner_post.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CornerPostAPIClient {
  static const String baseURL = 'https://www.rezervasyon.com/flutteryazar';
  final Client client = Client();

  Future<List<CornerPost>> getCornerPosts() async {
    List<CornerPost> posts = [];

    final Response response = await get(Uri.parse(baseURL));

    final List fetchedJSON = jsonDecode(response.body) as List;
    for (Map<String, dynamic> map in fetchedJSON) {
      map['adminimage'] = 'https://www.rezervasyon.com/' + map['adminimage'];
      posts.add(CornerPost.fromMap(map));
    }
    return posts;
  }
}
