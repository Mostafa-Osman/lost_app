import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';

part 'otp_states.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit(this.registerRepository) : super(VerifyInitialState());
  AuthenticationRepository registerRepository;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  String flatButtonText = 'اعادة الارسال';
  bool isTimerOn = false;
  String? otpCode;
  int? resendToken;
  late String verificationId;

  //otp
  Future<void> sendOtp({required String phoneNumber}) async {
    otpCode = '';
    emit(PhoneOtpLoading());
    log('number otp:***$phoneNumber');
    await auth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          log('otp send successfully ');
          emit(PhoneOtpSuccess());
        });
      },
      verificationFailed: (FirebaseAuthException exception) {
        log('otp send Fail');
        log(exception.toString());

        emit(PhoneOtpError(exception.toString()));
      },
      codeSent: (String verificationID, int? reSendToken) {
        verificationId = verificationID;
        resendToken = resendToken;
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        log('otp send time out');
        emit(PhoneOtpTimeOut());
      },
      timeout: const Duration(seconds: 59),
      forceResendingToken: resendToken,
    );
  }

  Future<void> submitOTP() async {
    if (otpCode == null || otpCode!.length != 6) {
      emit(PhonePinCodeNotFilled());
    } else {
      PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode!,
      );
    }
  }

  void saveOtpCode(String? code) {
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
}
