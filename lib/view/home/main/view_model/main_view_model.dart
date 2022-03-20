import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/view/home/home_page/view/home_page_view.dart';

part 'main_view_model.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store, BaseViewModel {
  late GlobalKey<NavigatorState> homeNaviKey, wishListNaviKey, settingsNaviKey;
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {
    homeNaviKey = GlobalKey();
    wishListNaviKey = GlobalKey();
    settingsNaviKey = GlobalKey();
  }

  void onDispose() {}

  @observable
  TabItem tabItem = TabItem.Home;

  Map<TabItem, Widget> get pages => {
        TabItem.Home: HomePageView(),
        TabItem.Settings: Scaffold(
          body: Center(child: Text("SettingsView")),
        ),
        TabItem.WishList: Scaffold(
          body: Center(child: Text("WishListView")),
        ),
      };

  Map<TabItem, GlobalKey<NavigatorState>> get navigatorStateGlobalKeys => {
        TabItem.Home: homeNaviKey,
        TabItem.WishList: wishListNaviKey,
        TabItem.Settings: settingsNaviKey,
      };

  @action
  void setTabItem(TabItem newItem) {
    tabItem = newItem;
  }
}

enum TabItem { Home, WishList, Settings }
