import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
//import 'package:rezervasyon/pages/notif_settings.dart';
import 'package:rezervasyon/pages/ui_settings.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppThemeCubit appThemeCubit = BlocProvider.of<AppThemeCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            BlocBuilder<AppThemeCubit, ThemeData>(
              bloc: appThemeCubit,
              builder: (context, theme) {
                return CustomAppBar(
                  appBarType: AppBarType.Back,
                  isColorBlack: (() {
                    switch (theme.brightness) {
                      case Brightness.dark:
                        return false;

                      case Brightness.light:
                        return true;
                    }
                  }()),
                );
              },
            ),
            Container(
              width: size.width * .99,
              height: size.height * (13.4 / 16),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.color_lens_outlined,
                          size: 35,
                        ),
                        title: Text(
                          'Arayüz Ayarları',
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => UISettingsPage()));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.notifications_none_outlined,
                          size: 35,
                        ),
                        title: Text(
                          'Bildirim Ayarları',
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => NotifSettingsPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
