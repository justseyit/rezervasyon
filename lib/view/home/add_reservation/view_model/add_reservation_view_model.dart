import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/models/reservation.dart';
part 'add_reservation_view_model.g.dart';

class AddReservationViewModel = _AddReservationViewModelBase
    with _$AddReservationViewModel;

abstract class _AddReservationViewModelBase with Store, BaseViewModel {
  late TextEditingController peopleCountController;
  ObservableList<AppProperty> properties = ObservableList.of([]);
  @observable
  AppReservation reservation = AppReservation();
  @observable
  bool propertiesIsLoading = false;
  @observable
  int propertyId = -1;
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {
    peopleCountController = TextEditingController();
    peopleCountController.addListener(() {
      setReservation(
          reservation..kisiSayisi = int.tryParse(peopleCountController.text));
    });
  }

  void onDispose() {}
  @action
  void setLoading(bool newLoading) => propertiesIsLoading = newLoading;

  @action
  void setProperties(List<AppProperty> _properties) =>
      properties = ObservableList.of(_properties);
  @action
  void setReservation(AppReservation newReservation) =>
      reservation = newReservation;
  @action
  void setPropertyId(int id) => propertyId = id;

  Future<void> loadProperties() async {
    setLoading(true);
    setProperties(await propertyRepository.getAllProperties() ?? []);
    setLoading(false);
  }
}
