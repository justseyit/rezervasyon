import 'package:rezervasyon/models/news.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key, required this.news}) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: getItemsFromNews(news, size),
    );
  }

  List<Widget> getItemsFromNews(List<News> newsList, Size size) {
    List<Widget> items = [];
    for (News news in newsList) {
      List<News> tempList = List.from(newsList);
      tempList.remove(news);
      items.add(ListItem(
        news: news,
        relatedNews: tempList,
      ));
    }
    items.add(SizedBox(
      height: size.height / 15,
    ));
    return items;
  }
}
