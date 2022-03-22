import 'package:flutter/material.dart';

import 'package:rezervasyon/models/reservation.dart';

import '../../../view/home/rezervation_detail/view/rezervation_detail_view.dart';

class ReservationCard extends StatelessWidget {
  final AppReservation reservation;
  const ReservationCard({Key? key, required this.reservation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Rezervasyon Bilgisi"),
      subtitle: Text(
          "Dolu mu : ${reservation.status}\nKişi Sayısı: ${reservation.kisiSayisi}\nMisafir Sayısı: ${reservation.misafirSayisi}\nYaş Aralığı: ${reservation.yasAraligi}"),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  RezervationDetailView(reservation: reservation),
            ));
      },
    );
  }
}
