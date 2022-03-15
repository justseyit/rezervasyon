/*import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/models/news_category.dart';
import 'package:rezervasyon/utils/constants.dart';
import 'package:rezervasyon/utils/token_manager.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifSettingsPage extends StatefulWidget {
  const NotifSettingsPage({Key? key}) : super(key: key);

  @override
  _NotifSettingsPageState createState() => _NotifSettingsPageState();
}

class _NotifSettingsPageState extends State<NotifSettingsPage> {
  Map<String, bool> categories = {};
  late final SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    /*for(NewsCategory category in Constants.categories){
      categories[category.title] = false;
    }*/
    getPrefs().then((value) => setState(() {}));
  }

  List<Widget> getTiles() {
    List<Widget> tiles = [];
    categories.forEach((category, catvalue) {
      tiles.add(ListTile(
        leading: (() {
          switch (category) {
            case 'Spor':
              return Icon(
                Icons.sports_baseball_outlined,
                size: 35,
              );

            case 'Gündem':
              return Icon(
                Icons.whatshot_outlined,
                size: 35,
              );

            case 'Siyaset':
              return Icon(
                Icons.groups_outlined,
                size: 35,
              );

            case 'Ekonomi':
              return Icon(
                Icons.show_chart_outlined,
                size: 35,
              );

            case 'Dünya':
              return Icon(
                Icons.public,
                size: 35,
              );

            case 'Magazin':
              return Icon(
                Icons.recent_actors_outlined,
                size: 35,
              );

            case 'Teknoloji':
              return Icon(
                Icons.phonelink_outlined,
                size: 35,
              );
          }
        }()),
        title: Text(
          category,
          style: TextStyle(fontSize: 25),
        ),
        trailing: Switch(
          value: catvalue,
          onChanged: (value) async {
            setState(() {
              categories[category] = value;
              preferences.setBool(category, value);
              print(catvalue);
            });
            List<String> categoryCodes = [];
            List<String> categoryCodesToRemove = [];
            for (NewsCategory category in Constants.categories) {
              if (preferences.containsKey(category.title)) {
                if (categories[category.title] == true) {
                  categoryCodes.add(category.code);
                } else {
                  categoryCodesToRemove.add(category.code);
                }
              }
            }
            await TokenManager.setToken(TokenManager.token, categories: categoryCodes);
            if (categoryCodesToRemove.length != 0) await TokenManager.removeToken(TokenManager.token, categories: categoryCodesToRemove);
          },
        ),
        onTap: () async {
          setState(() {
            categories[category] = !categories[category]!;
            preferences.setBool(category, categories[category]!);
            print(catvalue);
          });
          List<String> categoryCodes = [];
          List<String> categoryCodesToRemove = [];
          for (NewsCategory category in Constants.categories) {
            if (preferences.containsKey(category.title)) {
              if (categories[category.title] == true) {
                categoryCodes.add(category.code);
              } else {
                categoryCodesToRemove.add(category.code);
              }
            }
          }
          await TokenManager.setToken(TokenManager.token, categories: categoryCodes);
          if (categoryCodesToRemove.length != 0) await TokenManager.removeToken(TokenManager.token, categories: categoryCodesToRemove);
        },
      ));
    });
    return tiles;
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
                  onButtonTap: () async {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
            Container(
              width: size.width * .99,
              height: size.height * (13.4 / 16),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: getTiles(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getPrefs() async {
    preferences = await SharedPreferences.getInstance();
    for (NewsCategory category in Constants.categories) {
      if (preferences.containsKey(category.title))
        categories[category.title] = preferences.getBool(category.title)!;
      else
        categories[category.title] = true;

      preferences.setBool(category.title, categories[category.title]!);
    }
  }
}
*/