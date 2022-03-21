import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/core/base/model/base_view_model.dart';
import 'package:rezervasyon/models/reservation.dart';
part 'rezervation_detail_view_model.g.dart';

class RezervationDetailViewModel = _RezervationDetailViewModelBase
    with _$RezervationDetailViewModel;

abstract class _RezervationDetailViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}

  void showDialogByResult(String text, Color bgColor) {
    showDialog(
      context: context!,
      builder: (_) {
        return AlertDialog(
          backgroundColor: bgColor,
          content: Text(text),
          actions: [
            TextButton(
              child: Text(
                "Tamam",
                style: TextStyle(
                  color: Theme.of(context!).colorScheme.onBackground,
                ),
              ),
              onPressed: () {
                Navigator.pop(context!);
                if (bgColor == Colors.green) {
                  Navigator.pop(context!);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> rezerveThisRezervation(AppReservation reservation) async {
    await showDialog(
      context: context!,
      builder: (_) => AlertDialog(
        content: Text("Rezervasyonu Onaylıyor Musunuz ?"),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
            child: Text(
              "Tamam",
              style: TextStyle(
                color: Theme.of(context!).colorScheme.onBackground,
              ),
            ),
            onPressed: () => okButtonAction(reservation),
          ),
        ],
      ),
    );
  }

  Future<void> okButtonAction(AppReservation reservation) async {
    bool result = await reservationRepository.bookReservationByReservationID(
        reservationID: reservation.id!);
    Navigator.pop(context!);
    if (result) {
      showDialogByResult("İşlem Başarılı", Colors.green);
    } else {
      showDialogByResult("Bir hata oluştu.", Colors.red);
    }
  }
}
