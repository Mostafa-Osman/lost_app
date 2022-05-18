import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/model/reset_password_model.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';

part 'otp_states.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit(this.registerRepository) : super(VerifyInitialState());
  AuthenticationRepository registerRepository;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final otpFormKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  String flatButtonText = 'اعادة الارسال';
  bool isTimerOn = false;
  String? otpCode;
  int? resendToken;
   String verificationId='';


  //otp
  Future<void> sendOtp({
    required String phoneNumber,
  }) async {
    otpCode = '';
    emit(PhoneOtpLoading());
    log('number otp:+2$phoneNumber');
    await auth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: onCodeAutoRetrievalError,
      timeout: const Duration(seconds: 120),
      forceResendingToken: resendToken,
    );
  }

  Future<void> sendVerifyCode(String phoneNumber) async {
    try {
      emit(PhoneSendOtpLoading());
      final Data isAlreadyExist = await registerRepository.verifyPhoneNumber(
        phone: phoneNumber,
      ) ;
      if (!isAlreadyExist.isRegistered) {
        await sendOtp(phoneNumber: phoneNumber);
      } else {
        emit(PhoneAlreadyExistState());
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      emit(PhoneVerifyCodeError(e.toString()));
    }
  }

  void codeSentSuccessfully(String verificationId, int? resendToken) {
    log('codeSent');
    try {
      this.verificationId = verificationId;
      this.resendToken = resendToken;
      // seconds = 59;
      // startTimer();
      emit(PhoneOtpSentSuccessfully());
    } catch (error) {
      log(error.toString());
    }
  }

  void onCodeSent(String verificationID, int? reSendToken) {
    verificationId = verificationID;
    resendToken = resendToken;
    emit(OtpRefreshUi());

  }

  void verificationFailed(FirebaseAuthException exception) {
    log('otp send Fail', error: exception);
    emit(PhoneOtpError(exception.toString()));
  }

  void onCodeAutoRetrievalError(String verificationID) {
    verificationId = verificationID;
    log('otp send time out');
    emit(PhoneOtpTimeOut());
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    try {
      await auth.signInWithCredential(credential);
    } catch (e) {
      log('otp send successfully ');
      emit(PhoneOtpSuccess());
      await signIn(credential);
    }
  }

  Future<void> submitOTP() async {
    log('Otp is$otpCode');
    log('verificationId is$verificationId');
    if (otpCode == null || otpCode!.length != 6) {
      emit(PhonePinCodeNotFilled());
    } else {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode!,
      );

      await signIn(credential);
    }
  }

  void saveOtpCode({required String code}) {
    otpCode = code;
    emit(OtpRefreshUi());
  }

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

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      emit(PhoneVerifyOtpLoading());
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneVerifyOtpSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-verification-code":
          emit(PhoneVerifyCodeError('الكود الذي ادخلته غير صحيح'));
          break;
        default:
          log(e.toString());
      }
    } catch (error) {
      emit(PhoneVerifyCodeError(error.toString()));
    }
  }


  ///////////////////////////////////////

  final registerFormKey = GlobalKey<FormState>();

  bool isVisibility = true;
  bool confirmNotVisible = true;
  final registerNameControl = TextEditingController();
  final registerEmailControl = TextEditingController();
  final registerPhoneControl = TextEditingController();
  final registerPasswordControl = TextEditingController();
  final registerConfirmPasswordControl = TextEditingController();
  late Data phoneIsFound ;

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
      emit(RegisterSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(RegisterError(message: e.toString()));
    }
  }

  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    emit(VerifyPhoneIsFoundLoading());
    try {
      phoneIsFound = await registerRepository.verifyPhoneNumber(
        phone: phoneNumber,
      )  ;
      log(phoneIsFound.toString());
      emit(VerifyPhoneIsFoundSuccess());
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
