import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';

import '../../../../models/category.dart';
import '../../../../models/property.dart';
part 'home_page_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store, BaseViewModel {
  ObservableList<AppCategory> categories = ObservableList.of([]);
  ObservableList<AppProperty> properties = ObservableList.of([]);

  @observable
  bool isLoadingForCategories = false;

  @observable
  bool isLoadingForProperties = false;

  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}

  Future<void> getCategories() async {
    setLoadingForCategory(true);
    List<AppCategory?> categoriesList =
        await categoryRepository.getCategories();
    categories.addAll(categoriesList.cast<AppCategory>());
    setLoadingForCategory(false);
  }

  Future<void> getProperties() async {
    setLoadingForProperty(true);
    List<AppProperty>? propertyList =
        await propertyRepository.getAllProperties();
    properties.addAll(propertyList ?? []);
    setLoadingForProperty(false);
  }

  @action
  void setLoadingForCategory(bool newLoading) =>
      isLoadingForCategories = newLoading;

  @action
  void setLoadingForProperty(bool newLoading) =>
      isLoadingForProperties = newLoading;
}
