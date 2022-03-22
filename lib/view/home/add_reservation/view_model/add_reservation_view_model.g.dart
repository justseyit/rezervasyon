// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_reservation_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddReservationViewModel on _AddReservationViewModelBase, Store {
  final _$reservationAtom =
      Atom(name: '_AddReservationViewModelBase.reservation');

  @override
  AppReservation get reservation {
    _$reservationAtom.reportRead();
    return super.reservation;
  }

  @override
  set reservation(AppReservation value) {
    _$reservationAtom.reportWrite(value, super.reservation, () {
      super.reservation = value;
    });
  }

  final _$propertiesIsLoadingAtom =
      Atom(name: '_AddReservationViewModelBase.propertiesIsLoading');

  @override
  bool get propertiesIsLoading {
    _$propertiesIsLoadingAtom.reportRead();
    return super.propertiesIsLoading;
  }

  @override
  set propertiesIsLoading(bool value) {
    _$propertiesIsLoadingAtom.reportWrite(value, super.propertiesIsLoading, () {
      super.propertiesIsLoading = value;
    });
  }

  final _$propertyIdAtom =
      Atom(name: '_AddReservationViewModelBase.propertyId');

  @override
  int get propertyId {
    _$propertyIdAtom.reportRead();
    return super.propertyId;
  }

  @override
  set propertyId(int value) {
    _$propertyIdAtom.reportWrite(value, super.propertyId, () {
      super.propertyId = value;
    });
  }

  final _$_AddReservationViewModelBaseActionController =
      ActionController(name: '_AddReservationViewModelBase');

  @override
  void setLoading(bool newLoading) {
    final _$actionInfo = _$_AddReservationViewModelBaseActionController
        .startAction(name: '_AddReservationViewModelBase.setLoading');
    try {
      return super.setLoading(newLoading);
    } finally {
      _$_AddReservationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProperties(List<AppProperty> _properties) {
    final _$actionInfo = _$_AddReservationViewModelBaseActionController
        .startAction(name: '_AddReservationViewModelBase.setProperties');
    try {
      return super.setProperties(_properties);
    } finally {
      _$_AddReservationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReservation(AppReservation newReservation) {
    final _$actionInfo = _$_AddReservationViewModelBaseActionController
        .startAction(name: '_AddReservationViewModelBase.setReservation');
    try {
      return super.setReservation(newReservation);
    } finally {
      _$_AddReservationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPropertyId(int id) {
    final _$actionInfo = _$_AddReservationViewModelBaseActionController
        .startAction(name: '_AddReservationViewModelBase.setPropertyId');
    try {
      return super.setPropertyId(id);
    } finally {
      _$_AddReservationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reservation: ${reservation},
propertiesIsLoading: ${propertiesIsLoading},
propertyId: ${propertyId}
    ''';
  }
}
