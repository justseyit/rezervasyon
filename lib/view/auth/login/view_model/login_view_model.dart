import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/production/providers/user_provider.dart';
import 'package:rezervasyon/view/auth/login/model/login_model.dart';

import '../../../../models/user.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  late LoginModel model;
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {
    model = LoginModel();
  }

  void onDispose() {}

  @action
  void updateLoginModel({String? username, String? password, String? email}) {
    if (email != null) {
      model.email = email;
      model.username = null;
    }
    if (password != null) model.password = password;
    if (username != null) {
      model.username = username;
      model.email = null;
    }
  }

  Future<void> login() async {
    if (model.email != null || model.username != null) {
      if (model.password != null) {
        AppUser? user = await authRepository.login(
            username: model.username ?? model.email!,
            password: model.password!);
        if (user != null) {
          showSuccess("Tamam");
          context!.read<UserProvider>().setUser(user);
        }
      } else {
        showError("Şifrenizi girmelisiniz.");
      }
    } else {
      showError("Email veya Kullanıcı adınızı girmelisiniz.");
    }
  }
}
