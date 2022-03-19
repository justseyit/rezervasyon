// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainViewModel on _MainViewModelBase, Store {
  final _$tabItemAtom = Atom(name: '_MainViewModelBase.tabItem');

  @override
  TabItem get tabItem {
    _$tabItemAtom.reportRead();
    return super.tabItem;
  }

  @override
  set tabItem(TabItem value) {
    _$tabItemAtom.reportWrite(value, super.tabItem, () {
      super.tabItem = value;
    });
  }

  final _$_MainViewModelBaseActionController =
      ActionController(name: '_MainViewModelBase');

  @override
  void setTabItem(TabItem newItem) {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.setTabItem');
    try {
      return super.setTabItem(newItem);
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabItem: ${tabItem}
    ''';
  }
}
