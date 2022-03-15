import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/widgets/banner_slider_item.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class BannerSlider extends StatefulWidget {
  const BannerSlider({Key? key, required this.news}) : super(key: key);

  final List<News> news;

  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController controller = PageController();
  int pageNum = 0;
  bool userClicked = false;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (userClicked == true) {
        userClicked = false;
      } else {
        if (pageNum < 9) {
          pageNum++;
        } else {
          pageNum = 0;
        }
        if (controller.hasClients) {
          controller.animateToPage(pageNum, curve: Curves.linear, duration: Duration(milliseconds: pageNum != 0 ? 500 : 1000));
        }
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .99,
      height: size.height * .4,
      child: Column(
        children: [
          Container(
            width: size.width * .99,
            height: size.height * .3,
            child: PageView(
              onPageChanged: (int value) {
                pageNum = value;
                userClicked = true;
                if (mounted) {
                  setState(() {});
                }
                print(value);
              },
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: getItems(widget.news),
            ),
          ),
          Container(
            width: size.width * .99,
            height: size.height * .1,
            child: Row(
              children: getChilds(widget.news.length, size),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getChilds(int num, Size size) {
    List<Widget> childs = [];
    for (int i = 1; i <= num; i++) {
      childs.add(InkWell(
        onTap: () {
          controller.animateToPage(i - 1, curve: Curves.linear, duration: Duration(milliseconds: (pageNum - (i - 1)).abs() <= 4 ? 500 : 1000));
          pageNum = i - 1;
          userClicked = true;
        },
        child: Container(
          width: (size.width * .99) / num,
          height: (size.width * .99) / num,
          child: Center(
            child: Text('$i'),
          ),
          decoration: BoxDecoration(
            border: (() {
              if (i == 1) {
                return Border.all(color: Theme.of(context).disabledColor);
              } else {
                return Border(
                  top: BorderSide(color: Theme.of(context).disabledColor),
                  bottom: BorderSide(color: Theme.of(context).disabledColor),
                  right: BorderSide(color: Theme.of(context).disabledColor),
                );
              }
            }()),
            color: (() {
              if (i == pageNum + 1) {
                return Colors.red;
              }
            }()),
          ),
        ),
      ));
    }
    return childs;
  }

  List<Widget> getItems(List<News> newsList) {
    List<Widget> items = [];
    for (News news in newsList) {
      List<News> tempList = List.from(newsList);
      tempList.remove(news);
      items.add(BannerSliderItem(
        news: news,
        relatedNews: tempList,
      ));
    }
    return items;
  }
}
