part of 'otp_cubit.dart';

@immutable
abstract class OtpStates {}

class VerifyInitialState extends OtpStates {}

class OtpRefreshUi extends OtpStates {}

class OtpLoading extends OtpStates {}


class OtpError extends OtpStates {}

class OtpShowSnakeBar extends OtpStates {
  final String message;

  OtpShowSnakeBar(this.message);
}

class OtpSignUp extends OtpStates {}

class OtpForgetPass extends OtpStates {}

class RegisterLoading extends OtpStates {}

class RegisterSuccess extends OtpStates {}

class RegisterError extends OtpStates {
  final String message;

  RegisterError({required this.message});
}
