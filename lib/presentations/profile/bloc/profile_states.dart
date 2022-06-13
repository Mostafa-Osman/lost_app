
abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {}

class ProfileDeletePostSuccessState extends ProfileState {}

class ProfileUpdateSuccessState extends ProfileState {}


class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState(this.error);
}
