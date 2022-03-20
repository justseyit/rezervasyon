import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/models/property.dart';
part 'properties_by_category_view_model.g.dart';

class PropertiesByCategoryViewModel = _PropertiesByCategoryViewModelBase
    with _$PropertiesByCategoryViewModel;

abstract class _PropertiesByCategoryViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}

  Future<List<AppProperty>?> getProperties() async {
    return await propertyRepository.getAllProperties();
  }
}
