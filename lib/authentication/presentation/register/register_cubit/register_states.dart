part of 'register_cubit.dart';

@immutable
abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoading extends RegisterStates {}

class RegisterSuccess extends RegisterStates {}

class RegisterError extends RegisterStates {
  final String message;

  RegisterError({required this.message});
}

class RegisterRefreshUi extends RegisterStates {}
