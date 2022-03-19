// import 'package:rezervasyon/pages/discover_page.dart';
// import 'package:rezervasyon/pages/home_page.dart';
// import 'package:rezervasyon/pages/authors_page.dart';
// import 'package:rezervasyon/widgets/bottom_navbar_page.dart';
// import 'package:flutter/material.dart';

// class PageHandler extends StatefulWidget {
//   const PageHandler({Key? key}) : super(key: key);

//   @override
//   _PageHandlerState createState() => _PageHandlerState();
// }

// class _PageHandlerState extends State<PageHandler> {
//   TabItem tabItem = TabItem.Homepage;

//   GlobalKey<NavigatorState> homepageNaviKey = GlobalKey<NavigatorState>();
//   GlobalKey<NavigatorState> discoverNaviKey = GlobalKey<NavigatorState>();
//   GlobalKey<NavigatorState> postsNaviKey = GlobalKey<NavigatorState>();

//   Map<TabItem, Widget> get pages => {
//         TabItem.Homepage: HomePage(),
//         TabItem.Discover: DiscoverPage(),
//         TabItem.Posts: AuthorsPage(),
//       };

//   Map<TabItem, GlobalKey<NavigatorState>> get navigatorStateGlobalKeys => {TabItem.Homepage: homepageNaviKey, TabItem.Discover: discoverNaviKey, TabItem.Posts: postsNaviKey};

//   @override
//   Widget build(BuildContext context) {
//     precacheImage(AssetImage('assets/images/bannerlogo.png'), context);
//     precacheImage(AssetImage('assets/images/search_active.png'), context);
//     return WillPopScope(
//       onWillPop: () async {
//         return !await navigatorStateGlobalKeys[tabItem]!.currentState!.maybePop();
//       },
//       child: BottomNavBarPage(
//         tabItem: tabItem,
//         pages: pages,
//         navigatorStateGlobalKeys: navigatorStateGlobalKeys,
//         onSelectedTab: (selectedTabItem) {
//           if (selectedTabItem == tabItem) {
//             navigatorStateGlobalKeys[selectedTabItem]!.currentState!.popUntil((route) => route.isFirst);
//           } else {
//             setState(() {
//               tabItem = selectedTabItem;
//             });
//           }
//         },
//       ),
//     );
//   }
// }
