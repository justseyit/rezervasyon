import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/src/api/observable_collections.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/production/widgets/cards/property_card.dart';
import 'package:rezervasyon/view/home/my_properties/view_model/my_properties_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';

class MyPropertiesView extends StatefulWidget {
  MyPropertiesView({Key? key}) : super(key: key);

  @override
  State<MyPropertiesView> createState() => _MyPropertiesViewState();
}

class _MyPropertiesViewState extends BaseViewState<MyPropertiesView> {
  late MyPropertiesViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<MyPropertiesViewModel>(
      viewModel: MyPropertiesViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
        await viewModel.loadProperties();
      },
      onPageBuilder: (context, model) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Mekanlarım"),
          ),
          body: buildMyPropertiesListChecker,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            tooltip: "Mekan Ekle",
          ),
        ),
      ),
      onDispose: () {},
    );
  }

  Widget get buildMyPropertiesListChecker => Observer(
        builder: (context) {
          if (viewModel.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.properties.isEmpty &&
              viewModel.isLoading == false) {
            return Center(
              child: Text("Mekan Bulunamadı"),
            );
          } else {
            return buildMyPropertyListView(viewModel.properties);
          }
        },
      );

  Widget buildMyPropertyListView(ObservableList<AppProperty> properties) {
    return ListView.builder(
      itemCount: properties.length,
      itemBuilder: (context, index) {
        return PropertyCard(item: properties[index]);
      },
    );
  }
}
