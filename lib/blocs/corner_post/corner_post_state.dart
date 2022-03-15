part of 'corner_post_bloc.dart';

abstract class CornerPostState extends Equatable {
  const CornerPostState();
}

class CornerPostInitial extends CornerPostState {
  @override
  List<Object> get props => [];
}

class FetchingCornerPostsState extends CornerPostState{
  @override
  List<Object?> get props => [];
}

class FetchedCornerPostsState extends CornerPostState{
  final List<CornerPost> posts;

  FetchedCornerPostsState({required this.posts});

  @override
  List<Object?> get props => [this.posts];
}

class CantFetchCornerPostsState extends CornerPostState{
  final Object exception;

  CantFetchCornerPostsState({required this.exception});

  @override
  List<Object?> get props => [this.exception];
}

