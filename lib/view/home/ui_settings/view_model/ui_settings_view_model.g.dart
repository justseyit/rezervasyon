// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UISettingsViewModel on _UISettingsViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_UISettingsViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isDarkModeAtom = Atom(name: '_UISettingsViewModelBase.isDarkMode');

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  final _$_UISettingsViewModelBaseActionController =
      ActionController(name: '_UISettingsViewModelBase');

  @override
  void setLoading(bool _isLoading) {
    final _$actionInfo = _$_UISettingsViewModelBaseActionController.startAction(
        name: '_UISettingsViewModelBase.setLoading');
    try {
      return super.setLoading(_isLoading);
    } finally {
      _$_UISettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDarkMode(dynamic value) {
    final _$actionInfo = _$_UISettingsViewModelBaseActionController.startAction(
        name: '_UISettingsViewModelBase.setDarkMode');
    try {
      return super.setDarkMode(value);
    } finally {
      _$_UISettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isDarkMode: ${isDarkMode}
    ''';
  }
}
