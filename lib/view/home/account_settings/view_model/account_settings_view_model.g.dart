// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountSettingsViewModel on _AccountSettingsViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_AccountSettingsViewModelBase.isLoading');

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

  final _$_AccountSettingsViewModelBaseActionController =
      ActionController(name: '_AccountSettingsViewModelBase');

  @override
  void setLoading(bool _isLoading) {
    final _$actionInfo = _$_AccountSettingsViewModelBaseActionController
        .startAction(name: '_AccountSettingsViewModelBase.setLoading');
    try {
      return super.setLoading(_isLoading);
    } finally {
      _$_AccountSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}