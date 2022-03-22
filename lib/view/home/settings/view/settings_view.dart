import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rezervasyon/view/home/account_settings/view/account_settings_view.dart';
import 'package:rezervasyon/view/home/my_properties/view/my_properties_view.dart';
import 'package:rezervasyon/view/home/my_reservations/view/my_reservations_view.dart';
import 'package:rezervasyon/view/home/settings/view_model/settings_view_model.dart';
import 'package:rezervasyon/view/home/ui_settings/view/ui_settings_view.dart';

import '../../../../core/base/widget/base_view.dart';

class SettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late SettingsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Material(
        child: SafeArea(
          child: buildSettingsPage,
        ),
      ),
      onDispose: () {},
    );
  }

  Widget get buildSettingsPage => Observer(
        builder: (context) {
          if (viewModel.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else {
            return buildSettingsPageContent;
          }
        },
      );

  Widget get buildSettingsPageContent => Column(
        children: <Widget>[
          buildSettingsPageBody,
        ],
      );

  Widget get buildSettingsPageBody => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            buildSettingsPageBodyContent,
          ],
        ),
      );

  Widget get buildSettingsPageBodyContent => Container(
        child: Column(
          children: <Widget>[
            buildSettingsPageBodyContentItem(
              icon: Icons.person_outlined,
              title: "Hesap",
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AccountSettingsView())),
            ),
            buildSettingsPageBodyContentItem(
              icon: Icons.color_lens_outlined,
              title: "Arayüz Ayarları",
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UISettingsView())),
            ),
            buildSettingsPageBodyContentItem(
              icon: Icons.place,
              title: "Mekanlarım",
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyPropertiesView())),
            ),
            buildSettingsPageBodyContentItem(
              icon: Icons.list,
              title: "Rezervasyonlarım",
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyReservationsView())),
            ),
            /*buildSettingsPageBodyContentItem(
              icon: Icons.notifications_none_outlined,
              title: "Bildirim Ayarları",
              onTap: () => Navigator.of(context).pushNamed("/settings/notif"),
            ),*/
          ],
        ),
      );

  buildSettingsPageBodyContentItem(
      {required IconData icon,
      required String title,
      required Future<Object?> Function() onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        size: 35,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 25),
      ),
      onTap: () => onTap(),
    );
  }
}
