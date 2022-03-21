import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/repository/auth/auth_repository.dart';

part 'account_settings_view_model.g.dart';

class AccountSettingsViewModel = _AccountSettingsViewModelBase with _$AccountSettingsViewModel;

abstract class _AccountSettingsViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {
    _fullNameController.text = AuthRepository.appUser!.adSoyad!;
    _emailController.text = AuthRepository.appUser!.email!;
    _usernameController.text = AuthRepository.appUser!.username!;
  }

  void onDispose() {}

  @action
  void setLoading(bool _isLoading) => isLoading = _isLoading;

  void onBackPressed() {
    Navigator.of(context!).pop();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  @observable
  void validateAndSaveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }
}
