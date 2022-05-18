import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/model/reset_password_model.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.loginRepository) : super(ResetPasswordInitial());
  AuthenticationRepository loginRepository;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController resetPasswordControl = TextEditingController();
  final TextEditingController resetConfirmPasswordControl =
      TextEditingController();
  final resetPasswordFormKey = GlobalKey<FormState>();
  final phoneNumberFormKey = GlobalKey<FormState>();
  late Data isVerifyPhoneNumber;

  bool resetPasswordVisibility = true;
  bool resetConfirmPasswordVisibility = true;
  bool isTimerFinished = true;

  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    emit(VerifyPhoneNumberLoading());
    try {
      isVerifyPhoneNumber = await loginRepository.verifyPhoneNumber(
        phone: phoneNumber,
      );
      log(isVerifyPhoneNumber.toString());
      emit(VerifyPhoneNumberSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(VerifyPhoneNumberError(e.toString()));
    }
  }

  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());
    try {
     final data= await loginRepository.resetPassword(
        phone: phoneNumberController.text,
        password: resetPasswordControl.text,
      );
      emit(ResetPasswordSuccess(data));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(ResetPasswordError(e.toString()));
    }
  }

  void changeResetVisibility() {
    resetPasswordVisibility = !resetPasswordVisibility;
    emit(ResetPasswordRefreshUi());
  }

  void changeResetConfirmVisibility() {
    resetConfirmPasswordVisibility = !resetConfirmPasswordVisibility;
    emit(ResetPasswordRefreshUi());
  }

  void checkTimerCanceled({required bool status}) {
    isTimerFinished = status;
    emit(ResetPasswordRefreshUi());
  }
}
