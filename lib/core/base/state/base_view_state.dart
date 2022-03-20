import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rezervasyon/repository/auth/auth_repository.dart';

abstract class BaseViewState<T extends StatefulWidget> extends State<T> {
  Size get screenSize => MediaQuery.of(context).size;

  double calculateDynamicHeight(double percentage) =>
      (screenSize.height * percentage) / 100;

  double calculateDynamicWidth(double percentage) =>
      (screenSize.width * percentage) / 100;

  AuthRepository authRepository = AuthRepository.instance;
}
