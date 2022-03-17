import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:rezervasyon/view/auth/register/model/register_model.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../models/user.dart';
import '../../../../production/providers/user_provider.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  late RegisterModel model;
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {
    model = RegisterModel();
  }

  @action
  void updateRegisterModel(
      {String? username,
      String? password,
      String? passwordAgain,
      String? email,
      String? fullName}) {
    if (email != null) model.email = email;
    if (password != null) model.password = password;
    if (passwordAgain != null) model.passwordAgain = passwordAgain;
    if (username != null) model.username = username;
    if (fullName != null) model.fullName = fullName;
  }

  Future<void> register() async {
    if (model.email != null &&
        model.username != null &&
        model.fullName != null) {
      if (model.password != null && model.passwordAgain == model.password) {
        AppUser? user = await authRepository.register(
          username: model.username!,
          password: model.password!,
          email: model.email!,
          fullName: model.fullName!,
        );
        if (user != null) {
          showSuccess("Tamam");
          context!.read<UserProvider>().setUser(user);
        }
      } else {
        if (model.password == null)
          showError("Şifrenizi girmelisiniz.");
        else
          showError("Girdiğiniz şifreler uyuşmuyor.");
      }
    } else {
      showError("Tüm alanlar doldurulmalıdır.");
    }
  }
}
