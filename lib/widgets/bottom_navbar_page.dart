import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/start/theme/theme_notifier.dart';
import '../view/home/main/view_model/main_view_model.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage(
      {Key? key,
      required this.tabItem,
      required this.onSelectedTab,
      required this.pages,
      required this.navigatorStateGlobalKeys})
      : super(key: key);

  final TabItem tabItem;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> pages;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorStateGlobalKeys;

  @override
  Widget build(BuildContext context) {
    final ThemeMode appThemeMode = context.read<ThemeProvider>().getTheme;
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        activeColor:
            appThemeMode == ThemeMode.dark ? Colors.white : Colors.black,
        inactiveColor: Theme.of(context).disabledColor,
        iconSize: 32,
        items: [
          tabItemToBottomNavigationBarItem(TabItem.Home, context, appThemeMode),
          tabItemToBottomNavigationBarItem(
              TabItem.WishList, context, appThemeMode),
          tabItemToBottomNavigationBarItem(
              TabItem.Settings, context, appThemeMode),
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
  }

  BottomNavigationBarItem tabItemToBottomNavigationBarItem(
      TabItem tabItem, BuildContext context, ThemeMode themeMode) {
    final TabItemData tabItemData = TabItemData.tabs[tabItem]!;
    late final Widget activeIcon;
    switch (tabItem) {
      case TabItem.Home:
        activeIcon = Icon(
          Icons.home,
          color: isDarkMode(themeMode) ? Colors.white : Colors.black,
        );
        break;

      case TabItem.WishList:
        activeIcon = Icon(
          Icons.book,
          color: isDarkMode(themeMode) ? Colors.white : Colors.black,
        );
        break;

      case TabItem.Settings:
        activeIcon = Icon(
          Icons.settings,
          color: isDarkMode(themeMode) ? Colors.white : Colors.black,
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

  bool isDarkMode(ThemeMode mode) => mode == ThemeMode.dark;
}

class TabItemData {
  final String title;
  final IconData iconData;

  TabItemData({required this.title, required this.iconData});

  static Map<TabItem, TabItemData> get tabs => {
        TabItem.Home:
            TabItemData(title: 'Ana Sayfa', iconData: Icons.home_outlined),
        TabItem.WishList:
            TabItemData(title: 'Kaydettiklerim', iconData: Icons.book_outlined),
        TabItem.Settings:
            TabItemData(title: 'Ayarlar', iconData: Icons.settings_outlined)
      };
}
