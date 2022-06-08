import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';

part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepository) : super(RegisterInitialState());
  final registerFormKey = GlobalKey<FormState>();
  AuthenticationRepository registerRepository;

  bool isVisibility = true;
  bool confirmNotVisible = true;
  final registerNameControl = TextEditingController();
  final registerEmailControl = TextEditingController();
  final registerPhoneControl = TextEditingController();
  final registerPasswordControl = TextEditingController();
  final registerConfirmPasswordControl = TextEditingController();
   bool phoneIsFound=false;



  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    emit(VerifyPhoneIsFoundLoading());
    try {
      final data = await registerRepository.verifyPhoneNumber(
        phone: phoneNumber,
      );
      phoneIsFound = data.data.isRegistered;
      log('is user already have account${phoneIsFound.toString()}');
      emit(VerifyPhoneIsFoundSuccess(data.message));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(VerifyPhoneIsFoundError(e.toString()));
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
