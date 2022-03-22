import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:rezervasyon/models/reservation.dart';
import 'package:rezervasyon/production/widgets/cards/reservation_card.dart';
import 'package:rezervasyon/view/home/add_reservation/view/add_reservation_view.dart';
import 'package:rezervasyon/view/home/my_reservations/view_model/my_reservations_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';
import '../../../../core/base/widget/base_view.dart';

class MyReservationsView extends StatefulWidget {
  MyReservationsView({Key? key}) : super(key: key);

  @override
  State<MyReservationsView> createState() => _MyReservationsViewState();
}

class _MyReservationsViewState extends BaseViewState<MyReservationsView> {
  late MyReservationsViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<MyReservationsViewModel>(
      viewModel: MyReservationsViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
        await viewModel.loadReservations();
      },
      onPageBuilder: (context, model) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Mekanlarım"),
          ),
          body: buildMyPropertiesListChecker,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddReservationView(),
                  ));
            },
            child: Icon(Icons.add),
            tooltip: "Mekan Ekle",
          ),
        ),
      ),
      onDispose: () {},
    );
  }

  Widget get buildMyPropertiesListChecker => Observer(
        builder: (context) {
          if (viewModel.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.reservations.isEmpty &&
              viewModel.isLoading == false) {
            return Center(
              child: Text("Mekan Bulunamadı"),
            );
          } else {
            return buildMyReservationListView(viewModel.reservations);
          }
        },
      );

  Widget buildMyReservationListView(
      ObservableList<AppReservation> reservations) {
    return ListView.builder(
      itemCount: reservations.length,
      itemBuilder: (context, index) {
        return ReservationCard(
          reservation: reservations[index],
        );
      },
    );
  }
}
