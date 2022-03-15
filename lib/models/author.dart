import 'package:rezervasyon/models/corner_post.dart';

class Author {
  late final String name;
  late final String photoURL;
  late final String id;
  int numOfPosts = 1;
  List<CornerPost> posts = [];

  static List<Author> authors = [];

  Author({required String name, required String photoURL, required String id, required CornerPost post}) {
    try {
      this.name = name;
      this.photoURL = photoURL;
      this.id = id;
      bool exists = false;
      for (Author author in authors) {
        if (id == author.id) {
          author.numOfPosts++;
          author.posts.add(post);
          exists = true;
        }
      }
      if (exists == false) authors.add(Author._internal(name: this.name, photoURL: this.photoURL, id: this.id, post: post));
    } catch (e) {
      print(e);
    }
  }

  Author._internal({required this.name, required this.photoURL, required this.id, required CornerPost post}) {
    posts.add(post);
  }
}
