import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/forget_password/reset_password_cubit/reset_password_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/otp_cubit/otp_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/widgets/otp_dialog.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/timer.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen();

  @override
  Widget build(BuildContext context) {
    final otpCubit = BlocProvider.of<OtpCubit>(context);
    final arguments = ModalRoute.of(context)!.settings.arguments! as List;

    return Scaffold(
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is PhoneVerifyOtpSuccess && arguments[0] as bool) {
            navigateTo(
              context,
              RouteConstant.resetPasswordRoute,
            );
          } else if (state is PhoneVerifyOtpSuccess &&
              arguments[0] as bool == false) {
            showDialog(
              context: context,
              builder: (BuildContext context) => OtpDialog(),
            );
          }
         
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const TextClass(
                    text: 'لقد ارسلنا اليك رمز التاكيد',
                    fontSize: 25,
                  ),
                  const SizedBox(height: 10),
                  TextClass(
                    text:
                        'تاكد من حصولك على رساله نصيه على رقم 010******55 تحتوي على رمز التاكيد',
                    textColor: lightGrey,
                  ),
                  const SizedBox(height: 50),
                  //pin code design
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Form(
                      key: otpCubit.otpFormKey,
                      child: PinCodeTextField(
                        appContext: context,
                        hintCharacter: '*',
                        length: 6,
                        animationType: AnimationType.fade,
                        autovalidateMode: AutovalidateMode.always,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 50,
                          fieldWidth: 43,
                          inactiveColor: grey,
                          selectedFillColor: mainColor,
                          selectedColor: grey,
                          activeFillColor: white,
                          inactiveFillColor: white,
                        ),
                        boxShadows: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            color: lightGrey,
                            blurRadius: 10,
                          )
                        ],
                        cursorColor: black,
                        enableActiveFill: true,
                        controller: otpCubit.otpController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          // otpCubit.submitOTP();
                          otpCubit.saveOtpCode(code:v);
                        },
                        onChanged: (value) {
                          log(value);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        height: 50,
                        child: CustomButton(
                          text: 'التالي',
                          onPressed: () {
                            otpCubit.submitOTP();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!otpCubit.isTimerOn)
                        TextClass(
                          text: 'لم يصلك الرمز ؟',
                          textColor: lightGrey,
                        ),
                      TextButtonClass(
                        text: otpCubit.flatButtonText,
                        textColor: mainColor,
                        onPressed: () {
                          if (!otpCubit.isTimerOn) {
                            if (arguments[0] as bool? ?? false) {
                              navigateTo(
                                context,
                                RouteConstant.resetPasswordRoute,
                              );
                            } else {
                              otpCubit.sendOtp(
                                phoneNumber: BlocProvider.of<OtpCubit>(context)
                                    .registerPhoneControl
                                    .text,
                              );
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  AlertDialogClass(
                                height: 240.0,
                                widget: const TextClass(
                                  text: 'تم اعاده ارسال رمز التاكيد',
                                  fontSize: 20,
                                ),
                                bottomWidget: TextButtonClass(
                                  text: 'تم',
                                  fontSize: 25,
                                  textColor: mainColor,
                                  onPressed: () {
                                    otpCubit.changeFlatButtonText(
                                      changeText: true,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      if (otpCubit.isTimerOn)
                        TimerClass(
                          seconds: 59,
                          interval: const Duration(milliseconds: 1000),
                          onFinished: () =>
                              otpCubit.changeFlatButtonText(changeText: false),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
