part of 'otp_cubit.dart';

@immutable
abstract class OtpStates {}

class VerifyInitialState extends OtpStates {}
//
// //otp
// class PhoneOtpLoading extends OtpStates {}
//
// class PhoneOtpSuccess extends OtpStates {}
//
// class PhoneSendOtpLoading extends OtpStates {}
//
// class PhoneAlreadyExistState extends OtpStates {
//
// }
//
// class PhoneVerifyCodeError extends OtpStates {
//   final String message;
//
//   PhoneVerifyCodeError(this.message);
// }
//
// class PhoneOtpSentSuccessfully extends OtpStates {}
//
// class PhoneOtpError extends OtpStates {
//   final String message;
//
//   PhoneOtpError(this.message);
// }
//
// class PhoneOtpTimeOut extends OtpStates {}
//
// class OtpRefreshUi extends OtpStates {}
//
// class PhonePinCodeNotFilled extends OtpStates {}
//
// class PhoneVerificationResendTimer extends OtpStates {}
// class PhoneVerifyOtpLoading extends OtpStates {}
// class PhoneVerifyOtpSuccess extends OtpStates {}



class OtpRefreshUi extends OtpStates {}


class OtpLoading extends OtpStates {}


class OtpNavigator extends OtpStates {}

class OtpError extends OtpStates {}

class OtpShowSnakeBar extends OtpStates {
  final String message;

  OtpShowSnakeBar(this.message);
}

class OtpSignUp extends OtpStates {}

class OtpForgetPass extends OtpStates {}


////////////////////////////
class RegisterInitialState extends OtpStates {}

class RegisterLoading extends OtpStates {}

class RegisterSuccess extends OtpStates {}

class RegisterError extends OtpStates {
  final String message;

  RegisterError({required this.message});

}
class VerifyPhoneIsFoundLoading extends OtpStates {}
class VerifyPhoneIsFoundError extends OtpStates {
  final String message;

  VerifyPhoneIsFoundError( this.message);
}
class VerifyPhoneIsFoundSuccess extends OtpStates {
  final String message;

  VerifyPhoneIsFoundSuccess( this.message);
}


