import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_states.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit() : super(VerifyInitialState());
  final FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();
  String flatButtonText = 'اعادة الارسال';
  bool isTimerOn = false;

  //otp
  void verifyNumber({required String phoneNumber}) {
    log('*******$phoneNumber');

    emit(PhoneOtpLoading());
    auth.verifyPhoneNumber(
      phoneNumber: '+20$phoneNumber',
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
      codeSent: (String verificationID, int? reSendToken) {},
      codeAutoRetrievalTimeout: (String verificationID) {
        log('otp send time out');
        emit(PhoneOtpTimeOut());
      },
    );
  }

  void changeFlatButtonText({required bool changeText}) {
    if (changeText) {
      flatButtonText = 'لارسال الرمز مره اخري برجاء الانتظار';
      isTimerOn = true;
    } else {
      flatButtonText = 'اعادة الارسال';
      isTimerOn = false;
    }
    emit(ChangeButtonTextSuccess());
  }
}
