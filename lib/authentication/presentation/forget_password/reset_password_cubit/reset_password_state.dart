part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordRefreshUi extends ResetPasswordState {}

class VerifyPhoneNumberLoading extends ResetPasswordState {}

class VerifyPhoneNumberSuccess extends ResetPasswordState {}

class VerifyPhoneNumberError extends ResetPasswordState {
  final String message;

  VerifyPhoneNumberError(this.message);
}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final String message;

  ResetPasswordError(this.message);
}
