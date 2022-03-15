import 'package:rezervasyon/models/corner_post.dart';
import 'package:rezervasyon/widgets/corner_post_list_item.dart';
import 'package:flutter/material.dart';

class CornerPostItemList extends StatelessWidget {
  const CornerPostItemList({Key? key, required this.posts}) : super(key: key);

  final List<CornerPost> posts;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: getItems(posts, size),
    );
  }

  List<Widget> getItems(List<CornerPost> posts, Size size) {
    List<Widget> items = [];
    for (CornerPost post in posts) {
      items.add(CornerPostListItem(post: post));
    }
    items.add(SizedBox(
      height: size.height / 15,
    ));
    return items;
  }
}
