import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rezervasyon/models/corner_post.dart';
import 'package:rezervasyon/repository/corner_post/corner_post_repository.dart';
import 'package:rezervasyon/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'corner_post_event.dart';
part 'corner_post_state.dart';

class CornerPostBloc extends Bloc<CornerPostEvent, CornerPostState> {
  CornerPostBloc() : super(CornerPostInitial());

  @override
  Stream<CornerPostState> mapEventToState(CornerPostEvent event) async* {
    final CornerPostRepository cpr = locator<CornerPostRepository>();
    if (event is FetchCornerPostsEvent) {
      try {
        yield FetchingCornerPostsState();
        final List<CornerPost>? posts = await cpr.getCornerPosts();
        yield FetchedCornerPostsState(posts: posts!);
      } catch (e) {
        yield CantFetchCornerPostsState(exception: e);
      }
    }
  }
}
