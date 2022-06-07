import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/model/reset_password_model.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';


part 'otp_states.dart';



class OtpCubit extends Cubit<OtpStates> {
  AuthenticationRepository registerRepository;
  UserPrefs userPrefs;

  OtpCubit( this.registerRepository, this.userPrefs)
      : super(VerifyInitialState());

  String otpCode = '';

  late String phone;
  late String pass;
  late String name;
  late String verificationId;

  void fillData(List args) {
    name = args[0] as String;
    phone = args[1].toString();//.replaceFirst('0', '');
    pass = args[2] as String;
  }

  //when phone number not right or otp wrong
  void callError(FirebaseAuthException e) {
    emit(OtpError());
    log('Error verified retry.... ', error: e);
    if (e.code == 'invalid-phone-number') {
      log('The provided phone number is not valid.');
      emit(OtpShowSnakeBar("wrong-phoneNumber"));
    }
    if (e.code == 'invalid-verification-code') {
      log('OTP is wrong, please recheck');
      emit(OtpShowSnakeBar("wrong-otp"));
    }
    if (e.code == 'too-many-requests') {
      log('Too many request for this phone.');
      emit(OtpShowSnakeBar("many-requests-to-same-num"));
    }
  }

  //Call this Function when the sim in the same phone include this app
  void callSuccess() {
    emit(OtpRefreshUi());
    log('Succeed verified go Home now....');
    emit(OtpForgetPass());
    log('forget');
  }

  void callSignUpSuccess(String? type) {
    emit(OtpRefreshUi());
    log('Succeed verified go Home now....');
    if (type == 'sign-up') {
      emit(OtpSignUp());
    } else {
      emit(OtpForgetPass());
      log('forget');
    }
  }

  //Call this Function when send otp successfully
  void callSend(String id) {

    log('Succeed send OTP with id .... id ');
    verificationId =id;
    emit(OtpShowSnakeBar("send-code-successfully"));
  }
  void autoRetrievalTimeOut(String id) {

    log('autoRetrivalTimeOut with id .... id ');
    verificationId =id;
   emit(OtpShowSnakeBar("send-code-successfully"));
  }



  Future<void> initService({required   String mobile,
 required String type,}

      ) async {
    return registerRepository
        .initialFirebaseService(callSignUpSuccess, type)!
        .then((value) {
      requestPhone(mobile, type);
    });
  }

  Future<void> requestPhone(String mobile, String? type) async {
    return await registerRepository.requestPhone(
      callError: callError,
      callSend: callSend,
      codeAutoRetrievalTimeout: autoRetrievalTimeOut,
      type: type,
      mobile: mobile,
      callSuccess: callSuccess,
    );
  }

  Future<void> verifyOTP(String smsCode) async {
    otpCode = smsCode;
    emit(OtpLoading());
    return await registerRepository.verifyOTP(
      verificationIdSent:verificationId ,
      callError: callError,
      smsCode: smsCode,
    );
  }

  bool isTimerOn = false;
  final otpFormKey = GlobalKey<FormState>();
  String flatButtonText = 'اعادة الارسال';
  void changeFlatButtonText({required bool changeText}) {
    if (changeText) {
      flatButtonText = 'لارسال الرمز مره اخري برجاء الانتظار';
      isTimerOn = true;
    } else {
      flatButtonText = 'اعادة الارسال';
      isTimerOn = false;
    }
    emit(OtpRefreshUi());
  }
  final registerFormKey = GlobalKey<FormState>();

  bool isVisibility = true;
  bool confirmNotVisible = true;
  final registerNameControl = TextEditingController();
  final registerEmailControl = TextEditingController();
  final registerPhoneControl = TextEditingController();
  final registerPasswordControl = TextEditingController();
  final registerConfirmPasswordControl = TextEditingController();
  late bool phoneIsFound ;


  Future<void> register() async {
    emit(RegisterLoading());
    log('cubit phone:${registerPhoneControl.text}');
    log('cubit password:${registerPasswordControl.text} ');
    log('cubit email:${registerEmailControl.text}, ');

    try {
      final data = await registerRepository.register(
        username: registerNameControl.text,
        password: registerPasswordControl.text,
        email: registerEmailControl.text,
        phone: registerPhoneControl.text,
      );
      log(data.toString());
      emit(OtpNavigator());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(OtpShowSnakeBar(e.toString()));
    }
  }

  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    emit(VerifyPhoneIsFoundLoading());
    try {
      final data = await registerRepository.verifyPhoneNumber(
        phone: phoneNumber,
      )  ;
      phoneIsFound=data.data.isRegistered;
      log(phoneIsFound.toString());
      emit(VerifyPhoneIsFoundSuccess(data.message));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(VerifyPhoneIsFoundError(e.toString()));
    }
  }

  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(OtpRefreshUi());
  }

  void setLoginData() {
    isVisibility = !isVisibility;
    emit(OtpRefreshUi());
  }

  void confirmVisibilityPassword() {
    confirmNotVisible = !confirmNotVisible;
    emit(OtpRefreshUi());
  }
}
