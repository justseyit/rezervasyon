import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/models/reservation.dart';
part 'my_reservations_view_model.g.dart';

class MyReservationsViewModel = _MyReservationsViewModelBase
    with _$MyReservationsViewModel;

abstract class _MyReservationsViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;
  ObservableList<AppReservation> reservations = ObservableList.of([]);
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}

  @action
  void setLoading(bool _loading) => isLoading = _loading;

  @action
  void setReservations(List<AppReservation> _properties) =>
      reservations = ObservableList.of(_properties);

  Future<void> loadReservations() async {
    setLoading(true);
    // setReservations(await reservationRepository.getAllReservations());
    setReservations([]);
    setLoading(false);
  }
}
