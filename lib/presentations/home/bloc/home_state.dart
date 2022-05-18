part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}
class HomeSuccessState extends HomeState {}
class HomeDeleteSuccessState extends HomeState {}
class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}


