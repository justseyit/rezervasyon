import 'package:rezervasyon/models/reservation.dart';

abstract class ReservationBase {
  Future<bool> addReservation({required AppReservation reservation});
  Future<bool> deleteReservationByReservationID({required int reservationID});
  Future<bool> bookReservationByReservationID({required int reservationID});
  Future<bool> unBookReservationByReservationID({required int reservationID});
  Future<List<AppReservation>> getAllReservations();
  Future<List<AppReservation>> getReservationsByPropertyID({required int propertyID});
}
