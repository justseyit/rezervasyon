import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/models/category.dart';
import 'package:rezervasyon/view/home/home_page/view_model/home_page_view_model.dart';
import 'package:rezervasyon/view/home/properties_by_category/view/properties_by_category_view.dart';
import 'package:rezervasyon/view/home/property_detail/view/property_detail_view.dart';

import '../../../../core/base/state/base_view_state.dart';
import '../../../../models/property.dart';

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
        viewModel.getProperties();
      },
      onPageBuilder: (context, model) => Material(
        child: SafeArea(
          child: Column(
            children: [
              buildSearchContainer,
              buildCategoryListChecker,
              buildPropertyListChecker,
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
            return viewModel.isLoadingForCategories
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildCategoryList;
          },
        ),
      );

  get buildPropertyListChecker => Expanded(
        child: Observer(
          builder: (context) {
            return viewModel.isLoadingForProperties
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildPropertyList;
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
        : InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PropertiesByCategoryView(category: category),
                  ));
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(category.profilePhotoUrl!),
                  child: Text(
                    (category.catName ?? "")[0],
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                Text(category.catName ?? "",
                    overflow: TextOverflow.ellipsis, maxLines: 1),
              ],
            ),
          );
  }

  get buildPropertyList => ListView.builder(
        padding: EdgeInsets.symmetric(vertical: calculateDynamicHeight(2)),
        itemCount: viewModel.properties.length,
        itemBuilder: buildPropertyItem,
      );

  Widget buildPropertyItem(BuildContext context, int index) {
    AppProperty item = viewModel.properties[index];
    return ListTile(
      title: Text(item.title ?? ""),
      leading: item.profilePhotoUrl == null
          ? null
          : CircleAvatar(
              backgroundImage: NetworkImage(item.profilePhotoUrl!),
              radius: 30,
            ),
      subtitle: Text(item.description ?? ""),
      isThreeLine: true,
      visualDensity: VisualDensity.comfortable,
      minVerticalPadding: 22,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyDetailView(property: item),
            ));
      },
    );
  }
}
