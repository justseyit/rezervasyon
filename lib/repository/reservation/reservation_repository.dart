import '../../models/reservation.dart';
import '../../services/reservation/fake_reservation_service.dart';
import '../../services/reservation/real_reservation_service.dart';

enum ReservationBackendSource { Real, Fake }

class ReservationRepository {
  static ReservationRepository? _instance;

  static ReservationRepository get instance {
    _instance ??= ReservationRepository._init();
    return _instance!;
  }

  ReservationRepository._init();

  final ReservationBackendSource _reservationBackendSource = ReservationBackendSource.Fake;

  final FakeReservationService _fakeReservationService = FakeReservationService.instance;
  final RealReservationService _realReservationService = RealReservationService.instance;

  Future<bool> addReservation({required AppReservation reservation}) {
    switch (_reservationBackendSource) {
      case ReservationBackendSource.Real:
        return _realReservationService.addReservation(reservation: reservation);
      case ReservationBackendSource.Fake:
      default:
        return _fakeReservationService.addReservation(reservation: reservation);
    }
  }

  Future<bool> deleteReservationByReservationID({required int reservationID}) {
    switch (_reservationBackendSource) {
      case ReservationBackendSource.Real:
        return _realReservationService.deleteReservationByReservationID(reservationID: reservationID);
      case ReservationBackendSource.Fake:
      default:
        return _fakeReservationService.deleteReservationByReservationID(reservationID: reservationID);
    }
  }

  Future<bool> bookReservationByReservationID({required int reservationID}) {
    switch (_reservationBackendSource) {
      case ReservationBackendSource.Real:
        return _realReservationService.bookReservationByReservationID(reservationID: reservationID);
      case ReservationBackendSource.Fake:
      default:
        return _fakeReservationService.bookReservationByReservationID(reservationID: reservationID);
    }
  }

  Future<bool> unBookReservationByReservationID({required int reservationID}) {
    switch (_reservationBackendSource) {
      case ReservationBackendSource.Real:
        return _realReservationService.unBookReservationByReservationID(reservationID: reservationID);
      case ReservationBackendSource.Fake:
      default:
        return _fakeReservationService.unBookReservationByReservationID(reservationID: reservationID);
    }
  }

  Future<List<AppReservation>> getAllReservations() {
    switch (_reservationBackendSource) {
      case ReservationBackendSource.Real:
        return _realReservationService.getAllReservations();
      case ReservationBackendSource.Fake:
      default:
        return _fakeReservationService.getAllReservations();
    }
  }

  Future<List<AppReservation>> getReservationsByPropertyID({required int propertyID}) {
    switch (_reservationBackendSource) {
      case ReservationBackendSource.Real:
        return _realReservationService.getReservationsByPropertyID(propertyID: propertyID);
      case ReservationBackendSource.Fake:
      default:
        return _fakeReservationService.getReservationsByPropertyID(propertyID: propertyID);
    }
  }
}
