import 'dart:async';

import 'package:rezervasyon/blocs/corner_post/corner_post_bloc.dart';
import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/models/author.dart';
import 'package:rezervasyon/widgets/app_drawer.dart';
import 'package:rezervasyon/widgets/author_item_list.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//ignore: must_be_immutable
class AuthorsPage extends StatelessWidget {
  AuthorsPage({Key? key}) : super(key: key);

  Completer<void> refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CornerPostBloc cornerPostBloc = BlocProvider.of<CornerPostBloc>(context);
    final AppThemeCubit appThemeCubit = BlocProvider.of<AppThemeCubit>(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<CornerPostBloc, CornerPostState>(
      bloc: cornerPostBloc,
      builder: (context, state) {
        if (state is CornerPostInitial) {
          cornerPostBloc.add(FetchCornerPostsEvent());
          return Scaffold(
            resizeToAvoidBottomInset: false,
          );
        } else if (state is FetchingCornerPostsState) {
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
        } else if (state is FetchedCornerPostsState) {
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
            body: RefreshIndicator(
              onRefresh: () {
                cornerPostBloc.add(FetchCornerPostsEvent());
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
                    Container(width: size.width * .99, height: size.height * (13.4 / 16), child: AuthorItemList(authors: Author.authors))
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
                child: Text('Yazarlar alınırken bir sorun oluştu.\nHata Kodu:\n${(state as CantFetchCornerPostsState).exception.toString()}'),
              ),
            ),
          );
        }
      },
    );
  }
}
