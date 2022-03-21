import 'package:flutter/material.dart';

import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/models/reservation.dart';
import 'package:rezervasyon/view/home/rezervation_detail/view_model/rezervation_detail_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';

class RezervationDetailView extends StatefulWidget {
  final AppReservation reservation;
  RezervationDetailView({Key? key, required this.reservation})
      : super(key: key);

  @override
  State<RezervationDetailView> createState() => _RezervationDetailViewState();
}

class _RezervationDetailViewState extends BaseViewState<RezervationDetailView> {
  late RezervationDetailViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<RezervationDetailViewModel>(
      viewModel: RezervationDetailViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        appBar: AppBar(),
        body: buildItemList,
      ),
      onDispose: () {},
    );
  }

  get buildItemList => ListView(
        padding: EdgeInsets.symmetric(
          horizontal: calculateDynamicWidth(1),
          vertical: calculateDynamicHeight(2),
        ),
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.background,
            child: Text(
              widget.reservation.aciklama ?? "",
            ),
          ),
          ListTile(
            title: Text("Eklenme Tarihi"),
            trailing: Text(widget.reservation.tarih!),
          ),
          ListTile(
            title: Text("Başlama Saati"),
            trailing: Text(widget.reservation.basSaat!),
          ),
          ListTile(
            title: Text("Bitiş Saati"),
            trailing: Text(widget.reservation.bitSaat!),
          ),
          ListTile(
            title: Text("Kişi Sayısı"),
            trailing: Text("${widget.reservation.kisiSayisi}"),
          ),
          ListTile(
            title: Text("Misafir Sayısı"),
            trailing: Text("${widget.reservation.misafirSayisi}"),
          ),
          ElevatedButton(
            onPressed: widget.reservation.status == 1
                ? () => viewModel.rezerveThisRezervation(widget.reservation)
                : () {},
            child: Text(widget.reservation.status == 1 ? "Rezerve Et" : "Dolu"),
            style: ElevatedButton.styleFrom(
              primary:
                  widget.reservation.status == 1 ? Colors.green : Colors.red,
            ),
          ),
        ],
      );
}
