import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TabItem { Homepage, Discover, Posts }

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({Key? key, required this.tabItem, required this.onSelectedTab, required this.pages, required this.navigatorStateGlobalKeys}) : super(key: key);

  final TabItem tabItem;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> pages;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorStateGlobalKeys;

  @override
  Widget build(BuildContext context) {
    final AppThemeCubit appThemeCubit = BlocProvider.of<AppThemeCubit>(context);
    return BlocBuilder<AppThemeCubit, ThemeData>(
      bloc: appThemeCubit,
      builder: (context, theme) {
        return CupertinoTabScaffold(
          resizeToAvoidBottomInset: false,
          tabBar: CupertinoTabBar(
            activeColor: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
            inactiveColor: Theme.of(context).disabledColor,
            iconSize: 32,
            items: [
              tabItemToBottomNavigationBarItem(TabItem.Homepage, context),
              tabItemToBottomNavigationBarItem(TabItem.Discover, context),
              tabItemToBottomNavigationBarItem(TabItem.Posts, context),
            ],
            onTap: (index) {
              onSelectedTab(TabItem.values[index]);
            },
          ),
          tabBuilder: (context, index) {
            TabItem item = TabItem.values[index];
            return CupertinoTabView(
              navigatorKey: navigatorStateGlobalKeys[item],
              builder: (context) {
                return pages[item]!;
              },
            );
          },
        );
      },
    );
  }

  BottomNavigationBarItem tabItemToBottomNavigationBarItem(TabItem tabItem, BuildContext context) {
    final TabItemData tabItemData = TabItemData.tabs[tabItem]!;
    late final Widget activeIcon;
    switch (tabItem) {
      case TabItem.Homepage:
        activeIcon = BlocBuilder<AppThemeCubit, ThemeData>(
          builder: (context, theme) {
            return Icon(
              Icons.home,
              color: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
            );
          },
        );
        break;

      case TabItem.Posts:
        activeIcon = BlocBuilder<AppThemeCubit, ThemeData>(
          builder: (context, theme) {
            return Icon(
              Icons.article,
              color: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
            );
          },
        );
        break;

      case TabItem.Discover:
        activeIcon = BlocBuilder<AppThemeCubit, ThemeData>(
          builder: (context, theme) {
            return Image.asset(
              'assets/images/search_active.png',
              color: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
            );
          },
        );
        break;
    }
    return BottomNavigationBarItem(
      activeIcon: activeIcon,
      icon: Icon(
        tabItemData.iconData,
        color: Theme.of(context).disabledColor,
      ),
      label: tabItemData.title,
      //ignore: deprecated_member_use
      /*title: Text(
        tabItemData.title,
        style: TextStyle(fontSize: 12),
      ),*/
    );
  }
}

class TabItemData {
  final String title;
  final IconData iconData;

  TabItemData({required this.title, required this.iconData});

  static Map<TabItem, TabItemData> get tabs => {TabItem.Homepage: TabItemData(title: 'Ana Sayfa', iconData: Icons.home_outlined), TabItem.Discover: TabItemData(title: 'Haberler', iconData: Icons.search_outlined), TabItem.Posts: TabItemData(title: 'Yazarlar', iconData: Icons.article_outlined)};
}
