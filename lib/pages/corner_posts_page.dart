import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/models/author.dart';
import 'package:rezervasyon/widgets/corner_post_item_list.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CornerPostsPage extends StatelessWidget {
  const CornerPostsPage({Key? key, required this.author}) : super(key: key);

  final Author author;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppThemeCubit appThemeCubit = BlocProvider.of<AppThemeCubit>(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            BlocBuilder<AppThemeCubit, ThemeData>(
              bloc: appThemeCubit,
              builder: (context, theme) {
                return CustomAppBar(
                  appBarType: AppBarType.Back,
                  isColorBlack: theme.brightness == Brightness.dark ? false : true,
                );
              },
            ),
            Container(
                width: size.width * .9,
                height: size.height * (13.4 / 16),
                child: CornerPostItemList(
                  posts: author.posts,
                ))
          ],
        ),
      ),
    );
  }
}
