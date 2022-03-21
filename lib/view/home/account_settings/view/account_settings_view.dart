import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/widget/base_view.dart';
import '../view_model/account_settings_view_model.dart';

class AccountSettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
  late AccountSettingsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<AccountSettingsViewModel>(
      viewModel: AccountSettingsViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, model) => Material(
        child: SafeArea(
          child: buildAccountSettingsPage,
        ),
      ),
      onDispose: () {},
    );
  }

  Widget get buildAccountSettingsPage => Observer(
        builder: (context) {
          if (viewModel.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else {
            return buildAccountSettingsPageContent;
          }
        },
      );

  Widget get buildAccountSettingsPageContent => Column(
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
                viewModel.onBackPressed();
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
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Tam Adınız",
                    hintText: "Tam Ad",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adınız",
                    hintText: "Kullanıcı Adı",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "E Posta Adresiniz",
                    hintText: "E Posta Adresi",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.validateAndSaveForm();
                  },
                  child: Text("Kaydet"),
                ),
              )
            ],
          ),
        ),
      );
}
