// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchViewModel on _SearchViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_SearchViewModelBase.isLoading');

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

  final _$searchOperationAtom =
      Atom(name: '_SearchViewModelBase.searchOperation');

  @override
  CancelableOperation<dynamic>? get searchOperation {
    _$searchOperationAtom.reportRead();
    return super.searchOperation;
  }

  @override
  set searchOperation(CancelableOperation<dynamic>? value) {
    _$searchOperationAtom.reportWrite(value, super.searchOperation, () {
      super.searchOperation = value;
    });
  }

  final _$_SearchViewModelBaseActionController =
      ActionController(name: '_SearchViewModelBase');

  @override
  void setLoading(bool newLoading) {
    final _$actionInfo = _$_SearchViewModelBaseActionController.startAction(
        name: '_SearchViewModelBase.setLoading');
    try {
      return super.setLoading(newLoading);
    } finally {
      _$_SearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProperties(List<AppProperty> newProperties) {
    final _$actionInfo = _$_SearchViewModelBaseActionController.startAction(
        name: '_SearchViewModelBase.setProperties');
    try {
      return super.setProperties(newProperties);
    } finally {
      _$_SearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void triggerSearchAction(String text) {
    final _$actionInfo = _$_SearchViewModelBaseActionController.startAction(
        name: '_SearchViewModelBase.triggerSearchAction');
    try {
      return super.triggerSearchAction(text);
    } finally {
      _$_SearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
searchOperation: ${searchOperation}
    ''';
  }
}
