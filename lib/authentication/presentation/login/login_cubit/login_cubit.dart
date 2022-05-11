import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/model/register_model.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';
part 'login_states.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepository) : super(LoginInitialState());
  AuthenticationRepository loginRepository;
  final formKey = GlobalKey<FormState>();
  final TextEditingController loginPhoneControl = TextEditingController();
  final TextEditingController loginPasswordControl = TextEditingController();

  bool resetPasswordVisibility = true;

  bool resetConfirmPasswordVisibility = true;
  late UserData userData;
  bool isVisibility = true;
  Future<void> login() async {
    emit(LoginLoading());
    try {
      userData= await loginRepository.login(
        password: loginPhoneControl.text,
        phone: loginPasswordControl.text,
      );
      log(userData.toString());
      emit(LoginSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(LoginError(e.toString()));
    }
  }





  void loginVisibilityPassword() {
    isVisibility = !isVisibility;
    emit(LoginRefreshUi());
  }


  void changeResetVisibility() {
    resetPasswordVisibility = !resetPasswordVisibility;
    emit(LoginRefreshUi());
  }

  void changeResetConfirmVisibility() {
    resetConfirmPasswordVisibility = !resetConfirmPasswordVisibility;
    emit(LoginRefreshUi());
  }
}
