// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase');

  @override
  void updateRegisterModel(
      {String? username,
      String? password,
      String? passwordAgain,
      String? email,
      String? fullName}) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.updateRegisterModel');
    try {
      return super.updateRegisterModel(
          username: username,
          password: password,
          passwordAgain: passwordAgain,
          email: email,
          fullName: fullName);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
