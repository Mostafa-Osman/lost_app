part of'add_person_cubit.dart';
@immutable
abstract class PersonDataStates {}

class PersonDataInitialState extends PersonDataStates {}
class RefreshUi extends PersonDataStates {}

class PictureState extends PersonDataStates {}

class GetCameraImageLoading extends PersonDataStates {}

class GetCameraImageSuccess extends PersonDataStates {}

class GetCameraImageError extends PersonDataStates {}

class GetGalleryImageLoading extends PersonDataStates {}

class GetGalleryImageSuccess extends PersonDataStates {}

class GetGalleryImageError extends PersonDataStates {}
