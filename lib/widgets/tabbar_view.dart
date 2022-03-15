import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:rezervasyon/utils/constants.dart';
import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/models/news_category.dart';
import 'package:rezervasyon/widgets/item_list.dart';
import 'package:rezervasyon/widgets/list_item.dart';
import 'package:rezervasyon/widgets/custom_tab.dart';
import 'package:flutter/material.dart';

class TabbarView extends StatelessWidget {
  const TabbarView({Key? key, required this.news, required this.isColorBlack, required this.onRefresh}) : super(key: key);
  final Map<NCategory, List<News>> news;

  final Future Function() onRefresh;

  final bool isColorBlack;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //final List<CustomTab> tabs = getTabs();
    //final NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);
    //final List<ListItem> items = getItemsFromNews(newsList);
    //final List<Widget> views = getViewsFromNews(newsList, tabs, size);
    final Map<String, List<Widget>> tabsNViews = getTabsNViews(news, size);
    return Container(
      height: size.height * (13.4 / 16),
      width: size.width * .99,
      child: ContainedTabBarView(
        tabBarProperties: TabBarProperties(
          labelColor: isColorBlack == true ? Colors.black : Colors.white,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 30),
          indicatorColor: isColorBlack == true ? Colors.black : Colors.white,
          unselectedLabelColor: Theme.of(context).disabledColor,
        ),
        tabs: tabsNViews['tabs']!,
        views: tabsNViews['views']!,
        onChange: (index) {
          print(index);
        },
      ),
    );
  }

  List<Widget> getItemsFromNews(List<News> newsList, Size size) {
    List<Widget> items = [];
    for (News news in newsList) {
      items.add(ListItem(
        news: news,
        relatedNews: newsList,
      ));
    }
    items.add(SizedBox(
      height: size.height / 15,
    ));
    return items;
  }

  /*List<CustomTab> getTabs(){
    List<CustomTab> tabs = [];
    for(int i = 0; i < 7; i++){
      tabs.add(CustomTab(category: NewsCategory(category: NCategory.values[i])));
    }
    return tabs;
  }*/

  Map<String, List<Widget>> getTabsNViews(news, size) {
    Map<String, List<Widget>> tabsNViews = {};
    List<Widget> tabs = [];
    //List<Widget> views;
    List<Widget> views = [];
    //List<News> temp = [];
    news.forEach((NCategory ncategory, List<News> newsList) {
      for (NewsCategory category in Constants.categories) {
        if (category.category == ncategory) {
          tabs.add(CustomTab(category: category));
          views.add(Container(
            child: Center(
              child: RefreshIndicator(
                onRefresh: onRefresh,
                child: ItemList(
                  news: newsList,
                ),
              ),
            ),
          ));
        }
      }
    });
    tabsNViews['tabs'] = List.from(tabs);
    tabsNViews['views'] = List.from(views);
    tabs.clear();
    views.clear();
    return tabsNViews;
  }
}
