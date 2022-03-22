// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_properties_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyPropertiesViewModel on _MyPropertiesViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_MyPropertiesViewModelBase.isLoading');

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

  final _$_MyPropertiesViewModelBaseActionController =
      ActionController(name: '_MyPropertiesViewModelBase');

  @override
  void setLoading(bool _loading) {
    final _$actionInfo = _$_MyPropertiesViewModelBaseActionController
        .startAction(name: '_MyPropertiesViewModelBase.setLoading');
    try {
      return super.setLoading(_loading);
    } finally {
      _$_MyPropertiesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProperties(List<AppProperty> _properties) {
    final _$actionInfo = _$_MyPropertiesViewModelBaseActionController
        .startAction(name: '_MyPropertiesViewModelBase.setProperties');
    try {
      return super.setProperties(_properties);
    } finally {
      _$_MyPropertiesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
