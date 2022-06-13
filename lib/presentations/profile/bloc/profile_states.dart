
abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class PostCommentLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {}

class ProfileDeletePostSuccessState extends ProfileState {}

class ProfileDeleteCommentSuccessState extends ProfileState {}
class ProfileUpdateCommentSuccessState extends ProfileState {}

class ProfileEmitEditCommentDialogState extends ProfileState {
  final String comment;
  final int postId;
  final int commentId;
  final int commentIndex;
  final int parentCommentId;
  final int parentCommentIndex;

  ProfileEmitEditCommentDialogState({
    required this.comment,
    required this.postId,
    required this.commentId,
    required this.commentIndex,
    required this.parentCommentId,
    required this.parentCommentIndex,
  });
}

class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState(this.error);
}
