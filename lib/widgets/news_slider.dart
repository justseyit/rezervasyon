import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/widgets/slider_item.dart';
import 'package:flutter/material.dart';

class NewsSlider extends StatelessWidget {
  const NewsSlider({Key? key, required this.news, required this.width, required this.height, required this.scrollDirection}) : super(key: key);

  final List<News> news;
  final double width;
  final double height;
  final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<SliderItem> items = getItemsFromNews(news, size);
    return Container(
      width: width,
      height: height,
      child: SingleChildScrollView(
        scrollDirection: scrollDirection,
        child: Container(
          height: height,
          child: Row(
            children: items,
          ),
        ),
      ),
    );
  }

  List<SliderItem> getItemsFromNews(List<News> newsList, Size size) {
    List<SliderItem> items = [];
    for (News news in newsList) {
      List<News> tempList = List.from(newsList);
      tempList.remove(news);
      items.add(SliderItem(
        width: 360,
        height: 550,
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        news: news,
        relatedNews: tempList,
      ));
    }
    return items.sublist(0, 8);
  }
}
