import 'package:auto_size_text/auto_size_text.dart';
import 'package:rezervasyon/models/news.dart';
//import 'package:rezervasyon/pages/view_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.news, required this.relatedNews}) : super(key: key);

  final News news;
  final List<News> relatedNews;

  @override
  Widget build(BuildContext context) {
    final ImageProvider titleImage = ExtendedNetworkImageProvider(news.urlToImage, cacheKey: news.id + '_list_item', imageCacheName: 'NewsListItem_${news.id}', cache: true); //NetworkImage('${news.urlToImage}');
    final Color infoColor = Theme.of(context).disabledColor;
    final TextStyle infoStyle = TextStyle(color: infoColor, fontSize: 14);
    final Size size = MediaQuery.of(context).size;
    final String publishedAt = (news.publshedAt.day <= 9 ? '0' + news.publshedAt.day.toString() : news.publshedAt.day.toString()) + '.' + (news.publshedAt.month <= 9 ? '0' + news.publshedAt.month.toString() : news.publshedAt.month.toString()) + '.' + news.publshedAt.year.toString();
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => null,
      /*{
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewPage(
                  htmlContent: news.description,
                  title: news.title,
                  urlToImage: news.urlToImage,
                  id: news.id,
                  urlToShare: news.articleUrl,
                  sliderNews: relatedNews,
                )));
      },*/
      child: Container(
        width: size.width * .99,
        height: size.height * .165,
        child: Row(
          children: [
            //Image
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                width: size.width * .25,
                height: size.width * .25,
                decoration: BoxDecoration(
                  image: DecorationImage(image: titleImage, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            //Title & Info
            Container(
              width: size.width * .6,
              height: size.width * .25,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: size.width / 2,
                      child: Text(
                        '${news.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: size.width * .5,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.watch_later_outlined,
                                      color: infoColor,
                                      size: 18,
                                    ),
                                    AutoSizeText(
                                      ' ' + publishedAt,
                                      style: infoStyle,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Container(
                                width: size.width * .5,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.remove_red_eye_outlined, color: infoColor, size: 18),
                                    AutoSizeText(
                                      ' ${news.newshit}',
                                      style: infoStyle,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
