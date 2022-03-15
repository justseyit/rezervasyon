import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UISettingsPage extends StatefulWidget {
  const UISettingsPage({Key? key}) : super(key: key);

  @override
  _UISettingsPageState createState() => _UISettingsPageState();
}

class _UISettingsPageState extends State<UISettingsPage> {
  late bool darkMode;
  late final SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    getPrefs().then((value) {
      darkMode = value;
    });
  }

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
            FutureBuilder(
                future: getPrefs(),
                builder: (context, snapshot) {
                  return Container(
                    width: size.width * .99,
                    height: size.height * (13.4 / 16),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.bedtime_outlined,
                                size: 35,
                              ),
                              title: Text(
                                'Koyu Mod',
                                style: TextStyle(fontSize: 25),
                              ),
                              trailing: Switch(
                                value: darkMode,
                                onChanged: (value) {
                                  setState(() {
                                    darkMode = value;
                                  });
                                  appThemeCubit.changeAppTheme(darkMode);
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  darkMode = !darkMode;
                                });
                                appThemeCubit.changeAppTheme(darkMode);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Future<bool> getPrefs() async {
    bool dark;
    preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('DarkMode'))
      dark = preferences.getBool('DarkMode')!;
    else
      dark = false;

    preferences.setBool('DarkMode', dark);

    return dark;
  }
}
