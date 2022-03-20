import 'package:rezervasyon/models/reservation.dart';
import 'package:rezervasyon/services/reservation/reservation_base.dart';

class FakeReservationService implements ReservationBase {
  static FakeReservationService? _instance;

  static FakeReservationService get instance {
    _instance ??= FakeReservationService._init();
    return _instance!;
  }

  FakeReservationService._init();

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
  Future<bool> unBookReservationByReservationID({required int reservationID}) {
    // TODO: implement unBookReservationByReservationID
    throw UnimplementedError();
  }

  @override
  Future<List<AppReservation>> getAllReservations() {
    // TODO: implement getAllReservations
    throw UnimplementedError();
  }

  @override
  Future<List<AppReservation>> getReservationsByPropertyID({required int propertyID}) {
    return Future.delayed(
        Duration(seconds: 1),
        () => [
              AppReservation(id: 3, firm: 18, tumZamanlar: "", tarih: "2022-02-18", basSaat: "18:30", bitSaat: "19:30", aciklama: "rezervasyon açıklama", cinsiyet: 0, yasAraligi: "25-35", kisiSayisi: 5, misafirSayisi: 1, bildirimSuresi: 15, status: 1, createdAt: "2022-02-18T08:51:59.000000Z", updatedAt: "2022-02-18T09:31:00.000000Z", profilePhotoUrl: "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF"),
              AppReservation(id: 3, firm: 18, tumZamanlar: "", tarih: "2022-02-18", basSaat: "18:30", bitSaat: "19:30", aciklama: "rezervasyon açıklama", cinsiyet: 0, yasAraligi: "25-35", kisiSayisi: 5, misafirSayisi: 1, bildirimSuresi: 15, status: 1, createdAt: "2022-02-18T08:51:59.000000Z", updatedAt: "2022-02-18T09:31:00.000000Z", profilePhotoUrl: "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF"),
              AppReservation(id: 3, firm: 18, tumZamanlar: "", tarih: "2022-02-18", basSaat: "18:30", bitSaat: "19:30", aciklama: "rezervasyon açıklama", cinsiyet: 0, yasAraligi: "25-35", kisiSayisi: 5, misafirSayisi: 1, bildirimSuresi: 15, status: 1, createdAt: "2022-02-18T08:51:59.000000Z", updatedAt: "2022-02-18T09:31:00.000000Z", profilePhotoUrl: "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF"),
            ]);
  }
}
