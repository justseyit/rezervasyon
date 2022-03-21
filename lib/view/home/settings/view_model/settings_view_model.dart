import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}

  @action
  void setLoading(bool _isLoading) => isLoading = _isLoading;
}
