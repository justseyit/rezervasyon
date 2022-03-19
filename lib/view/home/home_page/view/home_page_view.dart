import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/models/category.dart';
import 'package:rezervasyon/view/home/home_page/view_model/home_page_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends BaseViewState<HomePageView> {
  late HomePageViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
      viewModel: HomePageViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
        viewModel.getCategories();
      },
      onPageBuilder: (context, model) => Material(
        child: SafeArea(
          child: Column(
            children: [
              buildSearchContainer,
              buildCategoryListChecker,
            ],
          ),
        ),
      ),
      onDispose: () {},
    );
  }

  get buildSearchContainer => ListTile(
        tileColor: Theme.of(context).colorScheme.background,
        title: Text("Search"),
        trailing: Icon(Icons.search),
        onTap: () {},
      );

  get buildCategoryListChecker => SizedBox(
        width: double.infinity,
        height: calculateDynamicHeight(25),
        child: Observer(
          builder: (context) {
            return viewModel.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildCategoryList;
          },
        ),
      );

  get buildCategoryList => GridView.builder(
        padding: EdgeInsets.symmetric(
            vertical: calculateDynamicHeight(2), horizontal: 12),
        itemCount: viewModel.categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.35,
          mainAxisSpacing: 20,
        ),
        itemBuilder: buildGridCategoryItem,
        scrollDirection: Axis.horizontal,
      );

  Widget buildGridCategoryItem(BuildContext context, int index) {
    AppCategory category = viewModel.categories[index];
    return category.profilePhotoUrl == null
        ? CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text((category.catName ?? "")[0]),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(category.profilePhotoUrl!),
            child: Text(
              (category.catName ?? "")[0],
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          );
  }
}
