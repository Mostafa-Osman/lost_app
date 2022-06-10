part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterRefreshUi extends RegisterState {}

class VerifyPhoneIsFoundLoading extends RegisterState {}

class VerifyPhoneIsFoundError extends RegisterState {
  final String message;

  VerifyPhoneIsFoundError(this.message);
}

class VerifyPhoneIsFoundSuccess extends RegisterState {
  final String message;

  VerifyPhoneIsFoundSuccess(this.message);
}
