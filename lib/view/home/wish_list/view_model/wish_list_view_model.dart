import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';

import '../../../../models/property.dart';
part 'wish_list_view_model.g.dart';

class WishListViewModel = _WishListViewModelBase with _$WishListViewModel;

abstract class _WishListViewModelBase with Store, BaseViewModel {
  ObservableList<AppProperty> wishList = ObservableList.of([]);

  @observable
  bool isLoading = false;
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}

  @action
  void setWishList(List<AppProperty> properties) =>
      wishList = ObservableList.of(properties);

  @action
  void setLoading(bool _isLoading) => isLoading = _isLoading;

  Future<void> loadWishList() async {
    setLoading(true);
    setWishList((await propertyRepository.getAllProperties()) ?? []);
    setLoading(false);
  }
}
