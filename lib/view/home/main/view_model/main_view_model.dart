import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/pages/settings.dart';
import 'package:rezervasyon/view/home/home_page/view/home_page_view.dart';
import 'package:rezervasyon/view/home/settings/view/settings_view.dart';
import 'package:rezervasyon/view/home/wish_list/view/wish_list_view.dart';

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
          body: SettingsView(),
          //Center(child: Text("SettingsView")),
        ),
        TabItem.WishList: WishListView(),
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
