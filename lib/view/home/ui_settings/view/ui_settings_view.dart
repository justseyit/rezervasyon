import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/widget/base_view.dart';
import '../view_model/ui_settings_view_model.dart';

class UISettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UISettingsViewState();
}

class _UISettingsViewState extends State<UISettingsView> {
  late UISettingsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<UISettingsViewModel>(
      viewModel: UISettingsViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, model) => Material(
        child: SafeArea(
          child: buildUISettingsPage,
        ),
      ),
      onDispose: () {},
    );
  }

  Widget get buildUISettingsPage => Observer(
        builder: (context) {
          if (viewModel.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else {
            return buildUISettingsPageContent;
          }
        },
      );

  Widget get buildUISettingsPageContent => Column(
        children: <Widget>[
          buildUISettingsPageHeader,
          buildUISettingsPageBody,
        ],
      );

  Widget get buildUISettingsPageHeader => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            buildUISettingsPageHeaderContent,
          ],
        ),
      );

  Widget get buildUISettingsPageHeaderContent => Container(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                viewModel.onBackPressed();
              },
              iconSize: 32,
            ),
            SizedBox(
              width: 16,
            ),
            Text("Arayüz Ayarları", style: TextStyle(fontSize: 24)),
          ],
        ),
      );

  Widget get buildUISettingsPageBody => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            buildUISettingsPageBodyContent,
          ],
        ),
      );

  Widget get buildUISettingsPageBodyContent => Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              value: viewModel.isDarkMode,
              title: Text("Karanlık Mod", style: TextStyle(fontSize: 20)),
              onChanged: (value) {
                viewModel.setDarkMode(value);
              },
            )
          ],
        ),
      );

  buildUISettingsPageBodyContentItem({required IconData icon, required String title, required Future Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 32),
            SizedBox(
              width: 16,
            ),
            Text(title, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
