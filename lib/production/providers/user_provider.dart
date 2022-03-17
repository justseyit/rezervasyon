import 'package:flutter/material.dart';
import 'package:rezervasyon/models/user.dart';

class UserProvider extends ChangeNotifier {
  AppUser? user;
  bool get isLogined => user != null;

  setUser(AppUser appUser) {
    user = appUser;
    notifyListeners();
  }

  logOutUser() {
    user = null;
    notifyListeners();
  }
}
