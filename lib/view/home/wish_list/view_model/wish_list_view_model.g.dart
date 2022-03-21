// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WishListViewModel on _WishListViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_WishListViewModelBase.isLoading');

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

  final _$_WishListViewModelBaseActionController =
      ActionController(name: '_WishListViewModelBase');

  @override
  void setWishList(List<AppProperty> properties) {
    final _$actionInfo = _$_WishListViewModelBaseActionController.startAction(
        name: '_WishListViewModelBase.setWishList');
    try {
      return super.setWishList(properties);
    } finally {
      _$_WishListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool _isLoading) {
    final _$actionInfo = _$_WishListViewModelBaseActionController.startAction(
        name: '_WishListViewModelBase.setLoading');
    try {
      return super.setLoading(_isLoading);
    } finally {
      _$_WishListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
