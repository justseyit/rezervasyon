import 'package:rezervasyon/models/reservation.dart';

import 'reservation_base.dart';

class RealReservationService implements ReservationBase {
  static RealReservationService? _instance;

  static RealReservationService get instance {
    _instance ??= RealReservationService._init();
    return _instance!;
  }

  RealReservationService._init();

  @override
  Future<bool> addReservation({required AppReservation reservation}) {
    // TODO: implement addReservation
    throw UnimplementedError();
  }

  @override
  Future<bool> bookReservationByReservationID({required int reservationID}) {
    // TODO: implement bookReservationByReservationID
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteReservationByReservationID({required int reservationID}) {
    // TODO: implement deleteReservationByReservationID
    throw UnimplementedError();
  }

  @override
  Future<List<AppReservation>> getAllReservations() {
    // TODO: implement getAllReservations
    throw UnimplementedError();
  }

  @override
  Future<List<AppReservation>> getReservationsByPropertyID({required int propertyID}) {
    // TODO: implement getReservationsByPropertyID
    throw UnimplementedError();
  }

  @override
  Future<bool> unBookReservationByReservationID({required int reservationID}) {
    // TODO: implement unBookReservationByReservationID
    throw UnimplementedError();
  }
}
