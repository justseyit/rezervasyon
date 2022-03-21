import 'package:flutter/material.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';

import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/view/home/rezervation_detail/view/rezervation_detail_view.dart';

import '../../../../core/base/state/base_view_state.dart';
import '../../../../models/reservation.dart';
import '../view_model/property_detail_view_model.dart';

class PropertyDetailView extends StatefulWidget {
  final AppProperty property;
  PropertyDetailView({Key? key, required this.property}) : super(key: key);

  @override
  State<PropertyDetailView> createState() => _PropertyDetailViewState();
}

class _PropertyDetailViewState extends BaseViewState<PropertyDetailView> {
  late PropertyDetailViewModel viewModel;
  late final _images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJqotR5WhoD2XMwIsANHSSMapf01DcyKH-qw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJqotR5WhoD2XMwIsANHSSMapf01DcyKH-qw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVlh9NaG9SW-2QkrhXnDCocFL-E0uuW5cWfA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVlh9NaG9SW-2QkrhXnDCocFL-E0uuW5cWfA&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<PropertyDetailViewModel>(
      viewModel: PropertyDetailViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        appBar: AppBar(
          title: Text(widget.property.title ?? ""),
        ),
        body: buildPropertyDetailList,
      ),
      onDispose: () {},
    );
  }

  get buildPropertyDetailList => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // getVerticalSpacer,
            Expanded(child: buildReservationList),
          ],
        ),
      );
  Widget get buildImageList => SizedBox(
        width: double.infinity,
        height: calculateDynamicHeight(25),
        child: buildImageListPageView,
      );
  Widget get buildImageListPageView => PageView.builder(
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Card(
            child: Image.network(
              _images[index],
            ),
          );
        },
      );
  SizedBox get getVerticalSpacer => SizedBox(height: 12);

  Widget get buildReservationList => FutureBuilder<List<AppReservation>>(
        future: reservationRepository.getReservationsByPropertyID(
            propertyID: widget.property.id!),
        builder: (context, snapshot) {
          if (snapshot.data == null &&
              snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == null &&
              snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text("Bir Hata Oluştu."),
            );
          } else {
            return buildReservasionListView(snapshot.data ?? []);
          }
        },
      );

  buildReservasionListView(List<AppReservation> list) {
    return ListView.builder(
      itemCount: list.length + 7,
      itemBuilder: (context, index) {
        if (index == 0) {
          return buildImageList;
        } else if (index == 1) {
          return getVerticalSpacer;
        } else if (index == 2) {
          return ListTile(
            title: Text(
              widget.property.title ?? "",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            tileColor: Theme.of(context).colorScheme.background,
          );
        } else if (index == 3) {
          return getVerticalSpacer;
        } else if (index == 4) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.background,
            child: Text(
              widget.property.description!,
            ),
          );
        } else if (index == 5) {
          return getVerticalSpacer;
        } else if (index == 6) {
          return ListTile(
            title: Text("Rezervasyonlar"),
          );
        } else {
          AppReservation reservation = list[index - 7];
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
      },
    );
  }
}
