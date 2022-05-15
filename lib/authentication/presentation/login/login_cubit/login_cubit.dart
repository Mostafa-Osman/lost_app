import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/model/user_data_model.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';
part 'login_states.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepository) : super(LoginInitialState());
  AuthenticationRepository loginRepository;
  final formKey = GlobalKey<FormState>();
  final TextEditingController loginPhoneControl = TextEditingController();
  final TextEditingController loginPasswordControl = TextEditingController();


  late UserData userData;
  bool isVisibility = true;
  Future<void> login() async {
    emit(LoginLoading());
    try {

      userData= await loginRepository.login(
        password:loginPasswordControl.text,
        phone:loginPhoneControl.text,
      );
      await UserPrefs().setUserToken(userData.token!);

      log(userData.toString());
      emit(LoginSuccess(userData));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(LoginError(e.toString()));
    }
  }
  void loginVisibilityPassword() {
    isVisibility = !isVisibility;
    emit(LoginRefreshUi());
  }

  void setPhoneAndPassword({required String phone,required String password}){
    loginPhoneControl.text=phone;
    loginPasswordControl.text=password;
  }
}
