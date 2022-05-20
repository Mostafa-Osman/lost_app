part of 'create_post_cubit.dart';

@immutable
abstract class CreatePostStates {}

class PersonDataInitialState extends CreatePostStates {}

class RefreshUi extends CreatePostStates {}

class GetCameraImageLoading extends CreatePostStates {}

class GetCameraImageSuccess extends CreatePostStates {}

class GetCameraImageError extends CreatePostStates {}

class GetGalleryImageLoading extends CreatePostStates {}

class GetGalleryImageSuccess extends CreatePostStates {}

class GetGalleryImageError extends CreatePostStates {}

class CreatePostLoading extends CreatePostStates {}

class CreatePostSuccess extends CreatePostStates {}

class CreatePostError extends CreatePostStates {
  final String message;

  CreatePostError(this.message);
}
