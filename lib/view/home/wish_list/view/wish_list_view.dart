import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/src/api/observable_collections.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/production/widgets/cards/property_card.dart';
import 'package:rezervasyon/view/home/wish_list/view_model/wish_list_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';

class WishListView extends StatefulWidget {
  WishListView({Key? key}) : super(key: key);

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends BaseViewState<WishListView> {
  late WishListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<WishListViewModel>(
      viewModel: WishListViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
        await viewModel.loadWishList();
      },
      onPageBuilder: (context, model) => Material(
        child: SafeArea(
          child: buildWishedPropertyListChecker,
        ),
      ),
      onDispose: () {},
    );
  }

  get buildWishedPropertyListChecker => Observer(
        builder: (context) {
          if (viewModel.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.wishList.isEmpty &&
              viewModel.isLoading == false) {
            return Center(
              child: Text("Listeniz Boş"),
            );
          } else {
            return buildWishedPropertyList(viewModel.wishList);
          }
        },
      );

  buildWishedPropertyList(ObservableList<AppProperty> wishList) {
    return RefreshIndicator(
        child: ListView.builder(
          itemCount: wishList.length,
          itemBuilder: (context, index) {
            return PropertyCard(item: wishList[index]);
          },
        ),
        onRefresh: viewModel.loadWishList);
  }
}
