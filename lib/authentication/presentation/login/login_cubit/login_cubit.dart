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
  Future<void> login({required String phone,required String password}) async {
    emit(LoginLoading());
    try {
      log('*phone:* $phone');
      log('*password:* $password');
      userData= await loginRepository.login(
        phone:phone,
        password:password,

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

  // void setPhoneAndPassword({required String phone,required String password}){
  //   loginPhoneControl.text=phone;
  //   loginPasswordControl.text=password;
  //   emit(LoginRefreshUi());
  // }
}
