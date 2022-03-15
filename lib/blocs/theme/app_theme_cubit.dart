import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeCubit extends Cubit<ThemeData> {
  AppThemeCubit({required this.preferences}) : super(_lightTheme){
    getTheme();
  }

  final SharedPreferences preferences;


  static final ThemeData _lightTheme = ThemeData.light();
  static final ThemeData _darkTheme = ThemeData.dark();

  static late bool _darkMode;

  void changeAppTheme(bool dark){
    if(dark == true) emit(_darkTheme);
    else emit(_lightTheme);
    preferences.setBool('DarkMode', dark);
  }

  getTheme() {
    if(preferences.containsKey('DarkMode')) _darkMode = preferences.getBool('DarkMode')!;
    else _darkMode = false;
    changeAppTheme(_darkMode);
  }

}
