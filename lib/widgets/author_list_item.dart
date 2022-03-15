import 'package:auto_size_text/auto_size_text.dart';
import 'package:rezervasyon/models/author.dart';
import 'package:rezervasyon/pages/corner_posts_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AuthorListItem extends StatelessWidget {
  const AuthorListItem({Key? key, required this.author}) : super(key: key);

  final Author author;

  @override
  Widget build(BuildContext context) {
    final ImageProvider authorImage = ExtendedNetworkImageProvider(author.photoURL, cacheKey: author.id, imageCacheName: 'authorPP_${author.id}', cache: true); //NetworkImage('${author.photoURL}');
    final Color infoColor = Theme.of(context).disabledColor;
    final TextStyle infoStyle = TextStyle(color: infoColor, fontSize: 14);
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CornerPostsPage(author: author)));
      },
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
                  image: DecorationImage(image: authorImage, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            //Title & Info
            Container(
              width: size.width * .6,
              height: size.width * .25,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: size.width / 2,
                      child: Text(
                        '${author.name}',
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
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: size.width * .5,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.article_outlined,
                                    color: infoColor,
                                  ),
                                  AutoSizeText(
                                    ' ${author.numOfPosts.toString()} yazı',
                                    style: infoStyle,
                                    maxLines: 1,
                                  ),
                                ],
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
