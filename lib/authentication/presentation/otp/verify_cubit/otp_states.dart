part of 'otp_cubit.dart';

@immutable
abstract class OtpStates {}

class VerifyInitialState extends OtpStates {}

//otp
class PhoneOtpLoading extends OtpStates {}

class PhoneOtpSuccess extends OtpStates {}

class PhoneOtpError extends OtpStates {
  final String message;

  PhoneOtpError(this.message);
}

class PhoneOtpTimeOut extends OtpStates {}

class OtpRefreshUi extends OtpStates {}

class PhonePinCodeNotFilled extends OtpStates {}
