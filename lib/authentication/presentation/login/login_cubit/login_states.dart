part of'login_cubit.dart';
@immutable

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}
class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final UserData userData;

  LoginSuccess(this.userData);

}

class LoginError extends LoginStates {
  final String message;

  LoginError(this.message);
}


class LoginRefreshUi extends LoginStates {}


class VerifyPhoneLoading extends LoginStates {}
class VerifyPhoneError extends LoginStates {
  final String message;

  VerifyPhoneError( this.message);
}
class VerifyPhoneSuccess extends LoginStates {
  final String message;

  VerifyPhoneSuccess( this.message);
}
