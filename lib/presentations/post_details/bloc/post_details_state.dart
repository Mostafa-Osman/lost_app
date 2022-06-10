part of 'post_details_cubit.dart';

@immutable
abstract class PostDetailsState {}

class PostDetailsInitial extends PostDetailsState {}

class PostDetailsLoadingState extends PostDetailsState {}

class PostCommentLoadingState extends PostDetailsState {}

class PostDetailsSuccessState extends PostDetailsState {}

class PostDetailsDeletePostSuccessState extends PostDetailsState {}

class PostDetailsDeleteCommentSuccessState extends PostDetailsState {}

class PostDetailsUpdateCommentSuccessState extends PostDetailsState {}

class PostDetailsEmitEditCommentDialogState extends PostDetailsState {
  final String comment;
  final int postId;
  final int commentId;
  final int commentIndex;
  final int parentCommentId;
  final int parentCommentIndex;

  PostDetailsEmitEditCommentDialogState({
    required this.comment,
    required this.postId,
    required this.commentId,
    required this.commentIndex,
    required this.parentCommentId,
    required this.parentCommentIndex,
  });
}

class PostDetailsErrorState extends PostDetailsState {
  final String error;

  PostDetailsErrorState(this.error);
}

