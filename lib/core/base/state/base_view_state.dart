import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rezervasyon/repository/property/property_repository.dart';

import '../../../repository/reservation/reservation_repository.dart';

abstract class BaseViewState<T extends StatefulWidget> extends State<T> {
  Size get screenSize => MediaQuery.of(context).size;

  double calculateDynamicHeight(double percentage) =>
      (screenSize.height * percentage) / 100;

  double calculateDynamicWidth(double percentage) =>
      (screenSize.width * percentage) / 100;

  PropertyRepository propertyRepository = PropertyRepository.instance;
  ReservationRepository reservationRepository = ReservationRepository.instance;
}
