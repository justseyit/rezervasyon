import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/production/widgets/cards/property_card.dart';
import 'package:rezervasyon/view/home/search/view_model/search_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends BaseViewState<SearchView> {
  late SearchViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      viewModel: SearchViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        appBar: AppBar(
          title: Text("Mekan Ara"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildSearchField,
              Expanded(child: buildPropertyList),
            ],
          ),
        ),
      ),
      onDispose: () {},
    );
  }

  get buildSearchField => TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Mekan İsmi",
        ),
        onChanged: (value) {
          viewModel.textEditingController.text = value;
        },
      );

  get buildPropertyList => Observer(
        builder: (context) {
          if (viewModel.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.properties.isEmpty &&
              viewModel.isLoading == false) {
            return Center(
              child: Text("Mekan Bulunamadı"),
            );
          } else {
            return buildPropertyListView(viewModel.properties);
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
