import 'dart:async';

import 'package:rezervasyon/blocs/news/news_bloc.dart';
import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/models/news_category.dart';
import 'package:rezervasyon/widgets/app_drawer.dart';
import 'package:rezervasyon/widgets/banner_slider.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:rezervasyon/widgets/news_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/constants.dart';

//ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Completer<void> refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);
    final AppThemeCubit appThemeCubit = BlocProvider.of<AppThemeCubit>(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<NewsBloc, NewsState>(
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
          refreshCompleter.complete();
          refreshCompleter = Completer<void>();
          return Scaffold(
            key: scaffoldKey,
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
            resizeToAvoidBottomInset: false,
            body: RefreshIndicator(
              displacement: 80,
              onRefresh: () {
                newsBloc.add(FetchNewsEvent(categories: Constants.categories));
                return refreshCompleter.future;
              },
              child: Container(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    BlocBuilder<AppThemeCubit, ThemeData>(
                      bloc: appThemeCubit,
                      builder: (context, theme) {
                        return CustomAppBar(
                          appBarType: AppBarType.Menu,
                          onButtonTap: () => scaffoldKey.currentState!.openDrawer(),
                          isColorBlack: theme.brightness == Brightness.dark ? false : true,
                        );
                      },
                    ),
                    Container(
                      width: size.width * .99,
                      height: size.height * (13.4 / 16),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BannerSlider(news: state.news[NCategory.Journal]!.sublist(0, 10)),
                              Container(
                                width: size.width * 99,
                                child: Text(
                                  'Gündem',
                                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: size.width * .99,
                                child: NewsSlider(
                                  width: size.width,
                                  height: size.height / 3,
                                  scrollDirection: Axis.horizontal,
                                  news: state.news[NCategory.Journal]!,
                                ),
                              ),
                              Container(
                                width: size.width * 99,
                                child: Text(
                                  'Siyaset',
                                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: size.width * .99,
                                child: NewsSlider(
                                  width: size.width,
                                  height: size.height / 3,
                                  scrollDirection: Axis.horizontal,
                                  news: state.news[NCategory.Politics]!,
                                ),
                              ),
                              Container(
                                width: size.width * 99,
                                child: Text(
                                  'Ekonomi',
                                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: size.width * .99,
                                child: NewsSlider(
                                  width: size.width,
                                  height: size.height / 3,
                                  scrollDirection: Axis.horizontal,
                                  news: state.news[NCategory.Economy]!,
                                ),
                              ),
                              Container(
                                width: size.width * 99,
                                child: Text(
                                  'Spor',
                                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: size.width * .99,
                                child: NewsSlider(
                                  width: size.width,
                                  height: size.height / 3,
                                  scrollDirection: Axis.horizontal,
                                  news: state.news[NCategory.Sport]!,
                                ),
                              ),
                              SizedBox(height: size.height / 15)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
