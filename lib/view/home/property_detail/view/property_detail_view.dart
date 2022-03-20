import 'package:flutter/material.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';

import 'package:rezervasyon/models/property.dart';

import '../../../../core/base/state/base_view_state.dart';
import '../view_model/property_detail_view_model.dart';

class PropertyDetailView extends StatefulWidget {
  final AppProperty property;
  PropertyDetailView({Key? key, required this.property}) : super(key: key);

  @override
  State<PropertyDetailView> createState() => _PropertyDetailViewState();
}

class _PropertyDetailViewState extends BaseViewState<PropertyDetailView> {
  late PropertyDetailViewModel viewModel;
  late final _images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJqotR5WhoD2XMwIsANHSSMapf01DcyKH-qw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJqotR5WhoD2XMwIsANHSSMapf01DcyKH-qw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVlh9NaG9SW-2QkrhXnDCocFL-E0uuW5cWfA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVlh9NaG9SW-2QkrhXnDCocFL-E0uuW5cWfA&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<PropertyDetailViewModel>(
      viewModel: PropertyDetailViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        appBar: AppBar(
          title: Text(widget.property.title ?? ""),
        ),
        body: buildPropertyDetailList,
      ),
      onDispose: () {},
    );
  }

  get buildPropertyDetailList => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildImageList,
            getVerticalSpacer,
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      widget.property.title ?? "",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    tileColor: Theme.of(context).colorScheme.background,
                  ),
                  getVerticalSpacer,
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    color: Theme.of(context).colorScheme.background,
                    child: Text(
                      widget.property.description!,
                    ),
                  ),
                  getVerticalSpacer,
                  // buildRezervasionList,
                ],
              ),
            ),
          ],
        ),
      );
  Widget get buildImageList => SizedBox(
        width: double.infinity,
        height: calculateDynamicHeight(25),
        child: buildImageListPageView,
      );
  Widget get buildImageListPageView => PageView.builder(
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Card(
            child: Image.network(
              _images[index],
              // fit: BoxFit.cover,
            ),
          );
        },
      );
  SizedBox get getVerticalSpacer => SizedBox(height: 12);

  // get buildRezervasionList => FutureBuilder(
  //       // future: ,
  //       builder: (context, snapshot) {},
  //     );
}
