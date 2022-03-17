import 'package:flutter/material.dart';
import 'package:rezervasyon/repository/auth/auth_repository.dart';

abstract class BaseViewModel {
  BuildContext? context;
  void setContext(BuildContext newContext);
  void init();

  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(context!);
  AuthRepository get authRepository => AuthRepository.instance;

  void showSuccess(String text) {
    messenger.showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.green,
        action: SnackBarAction(
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
