import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';

import '../../../../models/category.dart';
part 'home_page_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store, BaseViewModel {
  ObservableList<AppCategory> categories = ObservableList.of([]);

  @observable
  bool isLoading = false;

  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}

  Future<void> getCategories() async {
    setLoading(true);
    List<AppCategory?> categoriesList =
        await categoryRepository.getCategories();
    // categoriesList.removeWhere((element) => element == null);
    categories.addAll(categoriesList.cast<AppCategory>());
    setLoading(false);
  }

  void setLoading(bool newLoading) => isLoading = newLoading;
}
