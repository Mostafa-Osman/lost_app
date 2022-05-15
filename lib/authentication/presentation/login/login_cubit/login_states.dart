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
