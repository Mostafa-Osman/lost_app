import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';

part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.registerRepository) : super(RegisterInitialState());
  final formKey = GlobalKey<FormState>();
  AuthenticationRepository registerRepository;

  bool isVisibility = true;
  bool confirmNotVisible = true;
  final registerNameControl = TextEditingController();
  final registerEmailControl = TextEditingController();
  final registerPhoneControl = TextEditingController();
  final registerPasswordControl = TextEditingController();
  final registerConfirmPasswordControl = TextEditingController();


  Future<void> register() async {
    emit(RegisterLoading());
    try {
      final data = await registerRepository.register(
        username: registerNameControl.text,
        password: registerPasswordControl.text,
        email: registerEmailControl.text,
        phone: registerPhoneControl.text,
      );
      log(data.toString());
      emit(RegisterSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(RegisterError(message: e.toString()));
    }
  }



  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(RegisterRefreshUi());
  }

  void setLoginData() {
    isVisibility = !isVisibility;
    emit(RegisterRefreshUi());
  }


  void confirmVisibilityPassword() {
    confirmNotVisible = !confirmNotVisible;
    emit(RegisterRefreshUi());
  }
}
