// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_reservations_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyReservationsViewModel on _MyReservationsViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_MyReservationsViewModelBase.isLoading');

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

  final _$_MyReservationsViewModelBaseActionController =
      ActionController(name: '_MyReservationsViewModelBase');

  @override
  void setLoading(bool _loading) {
    final _$actionInfo = _$_MyReservationsViewModelBaseActionController
        .startAction(name: '_MyReservationsViewModelBase.setLoading');
    try {
      return super.setLoading(_loading);
    } finally {
      _$_MyReservationsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReservations(List<AppReservation> _properties) {
    final _$actionInfo = _$_MyReservationsViewModelBaseActionController
        .startAction(name: '_MyReservationsViewModelBase.setReservations');
    try {
      return super.setReservations(_properties);
    } finally {
      _$_MyReservationsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
