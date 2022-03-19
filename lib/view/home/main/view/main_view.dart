import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/view/home/main/view_model/main_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';
import '../../../../widgets/bottom_navbar_page.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends BaseViewState<MainView> {
  late MainViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
      viewModel: MainViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Observer(builder: (context) {
        return BottomNavBarPage(
          tabItem: viewModel.tabItem,
          pages: viewModel.pages,
          navigatorStateGlobalKeys: viewModel.navigatorStateGlobalKeys,
          onSelectedTab: (selectedTabItem) {
            if (selectedTabItem == viewModel.tabItem) {
              viewModel.navigatorStateGlobalKeys[selectedTabItem]!.currentState!
                  .popUntil((route) => route.isFirst);
            } else {
              viewModel.setTabItem(selectedTabItem);
            }
          },
        );
      }),
      onDispose: () {},
    );
  }
}
