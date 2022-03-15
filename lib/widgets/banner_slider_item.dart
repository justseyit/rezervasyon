import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/pages/view_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class BannerSliderItem extends StatelessWidget {
  const BannerSliderItem({Key? key, required this.news, required this.relatedNews}) : super(key: key);

  final News news;
  final List<News> relatedNews;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      backgroundColor: Colors.red.withOpacity(.6),
    );
    return GestureDetector(
      onTap: () => null /*Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewPage(
                htmlContent: news.description,
                title: news.title,
                urlToImage: news.urlToImage,
                id: news.id,
                urlToShare: news.articleUrl,
                sliderNews: relatedNews,
              )))*/
      ,
      child: Container(
        width: size.width * .99,
        height: size.height * .4,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExtendedNetworkImageProvider(news.urlToImage, cache: true, cacheKey: news.id, imageCacheName: 'BannerSliderImage_${news.id}'), //NetworkImage(news.urlToImage),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: size.width * .8,
                child: Text(
                  '${news.title}',
                  style: style,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
