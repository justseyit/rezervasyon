import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';

part 'ui_settings_view_model.g.dart';

class UISettingsViewModel = _UISettingsViewModelBase with _$UISettingsViewModel;

abstract class _UISettingsViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}

  @action
  void setLoading(bool _isLoading) => isLoading = _isLoading;

  void onBackPressed() {
    Navigator.of(context!).pop();
  }

  @observable
  bool isDarkMode = true;

  @action
  void setDarkMode(value) => isDarkMode = value;
}
