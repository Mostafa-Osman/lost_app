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

class CreatePostLoading extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {}

class CreatePostError extends CreatePostState {
  final String message;

  CreatePostError(this.message);
}
class ScanPhotoLoading extends CreatePostState {}

class ScanPhotoSuccess extends CreatePostState {}

class ScanPhotoError extends CreatePostState {
  final String error;

  ScanPhotoError(this.error);
}
