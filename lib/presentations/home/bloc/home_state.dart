part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class PostCommentLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeDeletePostSuccessState extends HomeState {}

class HomeDeleteCommentSuccessState extends HomeState {}
class HomeUpdateCommentSuccessState extends HomeState {}

class HomeEmitEditCommentDialogState extends HomeState {
  final String comment;
  final int postId;
  final int commentId;
  final int commentIndex;
  final int parentCommentId;
  final int parentCommentIndex;

  HomeEmitEditCommentDialogState({
    required this.comment,
    required this.postId,
    required this.commentId,
    required this.commentIndex,
    required this.parentCommentId,
    required this.parentCommentIndex,
  });
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}
