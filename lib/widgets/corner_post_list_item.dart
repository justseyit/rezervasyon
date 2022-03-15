import 'package:auto_size_text/auto_size_text.dart';
import 'package:rezervasyon/models/corner_post.dart';
//import 'package:rezervasyon/pages/view_page.dart';
import 'package:flutter/material.dart';

class CornerPostListItem extends StatelessWidget {
  const CornerPostListItem({Key? key, required this.post}) : super(key: key);

  final CornerPost post;

  @override
  Widget build(BuildContext context) {
    final Color infoColor = Theme.of(context).disabledColor;
    final TextStyle infoStyle = TextStyle(color: infoColor, fontSize: 14);
    final Size size = MediaQuery.of(context).size;
    final String publishedAt = (post.publshedAt.day <= 9 ? '0' + post.publshedAt.day.toString() : post.publshedAt.day.toString()) + '.' + (post.publshedAt.month <= 9 ? '0' + post.publshedAt.month.toString() : post.publshedAt.month.toString()) + '.' + post.publshedAt.year.toString();
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => null /*{
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewPage(
                  htmlContent: post.description,
                  title: post.title,
                  urlToShare: post.articleUrl,
                )));
      }*/
      ,
      child: Container(
        width: size.width * .9,
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.article_outlined,
                  size: 100,
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
                        '${post.title}',
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
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: size.width * .5,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.watch_later_outlined,
                                      color: infoColor,
                                    ),
                                    AutoSizeText(
                                      publishedAt,
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
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: size.width * .5,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: infoColor,
                                    ),
                                    AutoSizeText(
                                      '${post.newshit}',
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
