import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
part 'refresh_password_view_model.g.dart';

class RefreshPasswordViewModel = _RefreshPasswordViewModelBase
    with _$RefreshPasswordViewModel;

abstract class _RefreshPasswordViewModelBase with Store, BaseViewModel {
  late TextEditingController emailController;
  @override
  void setContext(BuildContext ctx) => context = ctx;

  @override
  void init() {
    emailController = TextEditingController();
  }

  @override
  void onDispose() {
    emailController.dispose();
  }

  Future<void> sendPasswordEmail() async {
    messenger.clearSnackBars();
    if (EmailValidator.validate(emailController.text)) {
      bool result = await authRepository.sendResetPasswordEmail(
          email: emailController.text);
      if (!result) {
        showError("Şifre sıfırlama E-Postası gönderilirken bir hata oluştu.");
        return;
      }
      showSuccess("Şifre Sıfırlama E-Postası Gönderildi.");
      Future.delayed(
        Duration(milliseconds: 1500),
        () {
          messenger.clearSnackBars();
          Navigator.pop(context!);
        },
      );
    } else {
      showError("Bir E-Posta giriniz.");
    }
  }
}
