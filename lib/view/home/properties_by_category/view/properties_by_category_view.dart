import 'package:flutter/material.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/models/category.dart';
import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/production/widgets/cards/property_card.dart';
import 'package:rezervasyon/view/home/properties_by_category/view_model/properties_by_category_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';

class PropertiesByCategoryView extends StatefulWidget {
  final AppCategory category;
  PropertiesByCategoryView({Key? key, required this.category})
      : super(key: key);

  @override
  State<PropertiesByCategoryView> createState() =>
      _PropertiesByCategoryViewState();
}

class _PropertiesByCategoryViewState
    extends BaseViewState<PropertiesByCategoryView> {
  late PropertiesByCategoryViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<PropertiesByCategoryViewModel>(
      viewModel: PropertiesByCategoryViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        appBar: AppBar(
          title: Text(widget.category.catName!),
        ),
        body: buildPropertyList,
      ),
      onDispose: () {},
    );
  }

  get buildPropertyList => FutureBuilder<List<AppProperty>?>(
        future: viewModel.getProperties(),
        builder: (context, snapshot) {
          if (snapshot.data == null &&
              snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == null &&
              snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text("Bir Hata Oluştu."),
            );
          } else {
            return buildPropertyListView(snapshot.data ?? []);
          }
        },
      );

  buildPropertyListView(List<AppProperty> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return PropertyCard(item: list[index]);
      },
    );
  }
}
