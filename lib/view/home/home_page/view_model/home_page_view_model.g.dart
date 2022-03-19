// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageViewModel on _HomePageViewModelBase, Store {
  final _$isLoadingForCategoriesAtom =
      Atom(name: '_HomePageViewModelBase.isLoadingForCategories');

  @override
  bool get isLoadingForCategories {
    _$isLoadingForCategoriesAtom.reportRead();
    return super.isLoadingForCategories;
  }

  @override
  set isLoadingForCategories(bool value) {
    _$isLoadingForCategoriesAtom
        .reportWrite(value, super.isLoadingForCategories, () {
      super.isLoadingForCategories = value;
    });
  }

  final _$isLoadingForPropertiesAtom =
      Atom(name: '_HomePageViewModelBase.isLoadingForProperties');

  @override
  bool get isLoadingForProperties {
    _$isLoadingForPropertiesAtom.reportRead();
    return super.isLoadingForProperties;
  }

  @override
  set isLoadingForProperties(bool value) {
    _$isLoadingForPropertiesAtom
        .reportWrite(value, super.isLoadingForProperties, () {
      super.isLoadingForProperties = value;
    });
  }

  final _$_HomePageViewModelBaseActionController =
      ActionController(name: '_HomePageViewModelBase');

  @override
  void setLoadingForCategory(bool newLoading) {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.setLoadingForCategory');
    try {
      return super.setLoadingForCategory(newLoading);
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingForProperty(bool newLoading) {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.setLoadingForProperty');
    try {
      return super.setLoadingForProperty(newLoading);
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingForCategories: ${isLoadingForCategories},
isLoadingForProperties: ${isLoadingForProperties}
    ''';
  }
}
