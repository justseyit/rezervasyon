import 'package:rezervasyon/models/news.dart';
//import 'package:rezervasyon/pages/view_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({Key? key, this.padding, required this.width, required this.height, required this.news, required this.relatedNews}) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final double width;
  final double height;
  final News news;
  final List<News> relatedNews;
  @override
  Widget build(BuildContext context) {
    final String publishedAt = (news.publshedAt.day <= 9 ? '0' + news.publshedAt.day.toString() : news.publshedAt.day.toString()) + '.' + (news.publshedAt.month <= 9 ? '0' + news.publshedAt.month.toString() : news.publshedAt.month.toString()) + '.' + news.publshedAt.year.toString();
    return InkWell(
      onTap: () => null,
      /*Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewPage(
                htmlContent: news.description,
                title: news.title,
                urlToImage: news.urlToImage,
                id: news.id,
                urlToShare: news.articleUrl,
                sliderNews: relatedNews,
              ))),*/
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: ExtendedNetworkImageProvider(news.urlToImage, cacheKey: news.id + '_slider_item', imageCacheName: 'SliderItem_${news.id}', cache: true), //NetworkImage(news.urlToImage),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    child: Text(
                      news.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Theme.of(context).disabledColor,
                      size: 18,
                    ),
                    Text(
                      ' ' + publishedAt,
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
