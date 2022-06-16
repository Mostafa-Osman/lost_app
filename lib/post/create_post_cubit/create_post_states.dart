part of 'create_post_cubit.dart';

@immutable
abstract class CreatePostState {}

class PersonDataInitialState extends CreatePostState {}

class RefreshUi extends CreatePostState {}

class GetCameraImageLoading extends CreatePostState {}

class GetCameraImageSuccess extends CreatePostState {}

class GetCameraImageError extends CreatePostState {}

class GetGalleryImageLoading extends CreatePostState {}

class GetGalleryImageSuccess extends CreatePostState {}

class GetGalleryImageError extends CreatePostState {}

class SetPostLoading extends CreatePostState {}

class SetPostSuccess extends CreatePostState {}
class UpdatePostSuccess extends CreatePostState {
  final String message;
  final HomePost homePost;

  UpdatePostSuccess(this.message,this.homePost);
}


class SetPostError extends CreatePostState {
  final String message;

  SetPostError(this.message);
}
class ScanPhotoLoading extends CreatePostState {}

class ScanPhotoSuccess extends CreatePostState {}

class ScanPhotoError extends CreatePostState {
  final String error;

  ScanPhotoError(this.error);
}
