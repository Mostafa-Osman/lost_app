import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_states.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  // variable bool to change visibility (in reset password page)
  bool resetPasswordVisibility = true;

  // variable bool to confirm change visibility in (confirm reset password)
  bool resetConfirmPasswordVisibility = true;

  // variable bool to change visibility (in login page)
  bool isVisibility = true;

  // method to change visibility in login page
  void loginVisibilityPassword() {
    isVisibility = !isVisibility;
    emit(LoginVisibilityPasswordState());
  }

  // In reset password page

  // method to switch icon visibility
  void changeResetVisibility() {
    resetPasswordVisibility = !resetPasswordVisibility;
    emit(ResetVisibilityPasswordState());
  }

  // method to switch icon visibility (in confirm password field )
  void changeResetConfirmVisibility() {
    resetConfirmPasswordVisibility = !resetConfirmPasswordVisibility;
    emit(ResetConfirmVisibilityPasswordState());
  }
}
