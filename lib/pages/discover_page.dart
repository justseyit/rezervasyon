import 'dart:async';

import 'package:rezervasyon/blocs/news/news_bloc.dart';
import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/utils/constants.dart';
import 'package:rezervasyon/widgets/app_drawer.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:rezervasyon/widgets/tabbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//ignore: must_be_immutable
class DiscoverPage extends StatelessWidget {
  DiscoverPage({Key? key}) : super(key: key);

  Completer<void> refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);
    final AppThemeCubit appThemeCubit = BlocProvider.of<AppThemeCubit>(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: newsBloc,
      builder: (context, state) {
        if (state is InitialNewsState) {
          newsBloc.add(FetchNewsEvent(categories: Constants.categories));
          return Scaffold(
            resizeToAvoidBottomInset: false,
          );
        } else if (state is FetchingNewsState) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: size.width,
              height: size.height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is FetchedNewsState) {
          return Scaffold(
            drawer: BlocBuilder<AppThemeCubit, ThemeData>(
              bloc: appThemeCubit,
              builder: (context, theme) {
                return AppDrawer(
                  isColorBlack: (() {
                    switch (theme.brightness) {
                      case Brightness.dark:
                        return false;

                      case Brightness.light:
                        return true;
                    }
                  }()),
                );
              },
            ),
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            body: Container(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  BlocBuilder<AppThemeCubit, ThemeData>(
                    bloc: appThemeCubit,
                    builder: (context, theme) {
                      refreshCompleter.complete();
                      refreshCompleter = Completer<void>();
                      return CustomAppBar(
                        appBarType: AppBarType.Menu,
                        onButtonTap: () => scaffoldKey.currentState!.openDrawer(),
                        isColorBlack: theme.brightness == Brightness.dark ? false : true,
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment(0, .55),
                    child: BlocBuilder<AppThemeCubit, ThemeData>(
                      bloc: appThemeCubit,
                      builder: (context, theme) {
                        return Container(
                          child: TabbarView(
                            onRefresh: () {
                              newsBloc.add(FetchNewsEvent(categories: Constants.categories));
                              return refreshCompleter.future;
                            },
                            news: state.news,
                            isColorBlack: (() {
                              switch (theme.brightness) {
                                case Brightness.dark:
                                  return false;

                                case Brightness.light:
                                  return true;
                              }
                            }()),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: size.width,
              height: size.height,
              child: Center(
                child: Text('Haberler alınırken bir sorun oluştu.\nHata Kodu:\n${(state as CantFetchNewsState).exception.toString()}'),
              ),
            ),
          );
        }
      },
    );
  }
}
