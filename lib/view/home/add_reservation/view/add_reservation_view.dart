import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/view/home/add_reservation/view_model/add_reservation_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';

class AddReservationView extends StatefulWidget {
  AddReservationView({Key? key}) : super(key: key);

  @override
  State<AddReservationView> createState() => _AddReservationViewState();
}

class _AddReservationViewState extends BaseViewState<AddReservationView> {
  late AddReservationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<AddReservationViewModel>(
      viewModel: AddReservationViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
        await viewModel.loadProperties();
      },
      onPageBuilder: (context, model) => Material(
        child: SafeArea(
          child: buildAccountSettingsPage,
        ),
      ),
      onDispose: () {},
    );
  }

  Widget get buildAccountSettingsPage => Column(
        children: <Widget>[
          buildAccountSettingsPageHeader,
          buildAccountSettingsPageBody,
        ],
      );

  Widget get buildAccountSettingsPageHeader => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            buildAccountSettingsPageHeaderContent,
          ],
        ),
      );

  Widget get buildAccountSettingsPageHeaderContent => Container(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
              iconSize: 32,
            ),
            SizedBox(
              width: 16,
            ),
            Text("Hesap", style: TextStyle(fontSize: 24)),
          ],
        ),
      );

  Widget get buildAccountSettingsPageBody => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            buildAccountSettingsPageBodyContent,
          ],
        ),
      );

  Widget get buildAccountSettingsPageBodyContent => Container(
        child: Form(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildSelectPropertyListDropdown),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kişi Sayısı",
                    hintText: "Lişi",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    viewModel.peopleCountController.text = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Kaydet"),
                ),
              )
            ],
          ),
        ),
      );
  get buildSelectPropertyListDropdown => Observer(
        builder: (context) {
          if (viewModel.propertiesIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return DropdownButton<int>(
              items: viewModel.properties
                  .map<DropdownMenuItem<int>>(
                    (element) => DropdownMenuItem<int>(
                      child: Text(element.title!),
                      value: element.id,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                viewModel.setPropertyId(value ?? -1);
              },
              hint: Text("Bir Mekan Seçiniz"),
              value: viewModel.propertyId == -1 ? null : viewModel.propertyId,
            );
          }
        },
      );
}
