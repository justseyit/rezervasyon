import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/models/property.dart';
part 'my_properties_view_model.g.dart';

class MyPropertiesViewModel = _MyPropertiesViewModelBase
    with _$MyPropertiesViewModel;

abstract class _MyPropertiesViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;
  ObservableList<AppProperty> properties = ObservableList.of([]);
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}

  @action
  void setLoading(bool _loading) => isLoading = _loading;

  @action
  void setProperties(List<AppProperty> _properties) =>
      properties = ObservableList.of(_properties);

  Future<void> loadProperties() async {
    setLoading(true);
    setProperties((await propertyRepository.getAllProperties()) ?? []);
    setLoading(false);
  }
}
