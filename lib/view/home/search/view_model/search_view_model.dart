import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/models/property.dart';
part 'search_view_model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store, BaseViewModel {
  late TextEditingController textEditingController;
  ObservableList<AppProperty> properties = ObservableList.of([]);

  @observable
  bool isLoading = false;

  @observable
  CancelableOperation? searchOperation;
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      triggerSearchAction(textEditingController.text);
    });
  }

  void onDispose() {}

  @action
  void setLoading(bool newLoading) => isLoading = newLoading;

  @action
  void setProperties(List<AppProperty> newProperties) =>
      properties = ObservableList.of(newProperties);

  @action
  void triggerSearchAction(String text) {
    if (text.isNotEmpty) {
      searchOperation = CancelableOperation.fromFuture(
        Future.delayed(
          Duration(seconds: 2),
          () async {
            setLoading(true);
            await searchProperty(text);
          },
        ),
        onCancel: () {
          searchOperation?.cancel();
        },
      );
    }
  }

  Future<void> searchProperty(String title) async {
    List<AppProperty>? propertiesToAdd =
        await propertyRepository.getPropertiesByPropertyName(query: title);
    setProperties(propertiesToAdd ?? []);
    setLoading(false);
    FocusScope.of(context!).unfocus();
  }
}
