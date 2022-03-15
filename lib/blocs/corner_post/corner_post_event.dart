part of 'corner_post_bloc.dart';

abstract class CornerPostEvent extends Equatable {
  const CornerPostEvent();
}

class FetchCornerPostsEvent extends CornerPostEvent{
  @override
  List<Object?> get props => [];
}

