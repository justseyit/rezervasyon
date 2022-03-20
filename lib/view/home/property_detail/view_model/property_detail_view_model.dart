import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
part 'property_detail_view_model.g.dart';

class PropertyDetailViewModel = _PropertyDetailViewModelBase
    with _$PropertyDetailViewModel;

abstract class _PropertyDetailViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}
}
