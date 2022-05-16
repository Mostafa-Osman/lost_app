import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/otp_cubit/otp_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/widgets/otp_dialog.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/timer.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  final bool isFromResetPhone;

  const OtpScreen({required this.isFromResetPhone});

  @override
  Widget build(BuildContext context) {
    final otpCubit = BlocProvider.of<OtpCubit>(context);
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
    return Scaffold(
      body: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {
          // if (state is PhoneOtpLoading) {
          //   const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (state is PhoneOtpError) {
          //   showToast(state: ToastStates.error, message: state.message);
          // } else if (state is PhoneOtpTimeOut) {
          //   showToast(state: ToastStates.error, message: 'Time out');
          // } else if (state is PhoneOtpSuccess) {
          //   if (isFromResetPhone) {
          //     navigateTo(
          //       context,
          //       RouteConstant.resetPasswordRoute,
          //     );
          //   } else {
          //     BlocProvider.of<LoginCubit>(context).login(
          //       password: registerCubit.registerPasswordControl.text,
          //       phone: registerCubit.registerPhoneControl.text,
          //     );
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) => OtpDialog(),
          //     );
          //   }
          // }
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
                      key: otpCubit.formKey,
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
                          otpCubit.submitOTP();
                          otpCubit.saveOtpCode(v);
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
                            //todo step:1 check otp that user add it with otp in firebase true or not
                            //todo delete it after finish step: 1
                            if (isFromResetPhone) {
                              navigateTo(
                                context,
                                RouteConstant.resetPasswordRoute,
                              );
                            } else {
                              log('************${registerCubit.registerPhoneControl.text}');
                              log('************${registerCubit.registerPasswordControl.text}');
                              BlocProvider.of<LoginCubit>(context).login(
                                phone: registerCubit.registerPhoneControl.text,
                                password:
                                    registerCubit.registerPasswordControl.text,
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => OtpDialog(),
                              );
                            }
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
                            if (isFromResetPhone) {
                              navigateTo(
                                context,
                                RouteConstant.resetPasswordRoute,
                              );
                            } else {
                              otpCubit.sendOtp(
                                phoneNumber:
                                    BlocProvider.of<RegisterCubit>(context)
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
                        //todo change timer to 59
                        TimerClass(
                          seconds: 5,
                          // 59,
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
