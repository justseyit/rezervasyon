import 'package:flutter/material.dart';
import 'package:rezervasyon/repository/auth/auth_repository.dart';
import 'package:rezervasyon/repository/category/category_repository.dart';
import 'package:rezervasyon/repository/property/property_repository.dart';
import 'package:rezervasyon/repository/reservation/reservation_repository.dart';

abstract class BaseViewModel {
  BuildContext? context;
  void setContext(BuildContext newContext);
  void init();
  void onDispose();

  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(context!);
  AuthRepository get authRepository => AuthRepository.instance;
  CategoryRepository get categoryRepository => CategoryRepository.instance;
  PropertyRepository get propertyRepository => PropertyRepository.instance;
  ReservationRepository get reservationRepository =>
      ReservationRepository.instance;
  void showSuccess(String text, {bool? showAction}) {
    messenger.showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.green,
        action: showAction == false
            ? null
            : SnackBarAction(
                label: "Tamam",
                onPressed: () {
                  messenger.hideCurrentSnackBar();
                },
              ),
      ),
    );
  }

  void showError(String text) {
    messenger.showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {
            messenger.hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
