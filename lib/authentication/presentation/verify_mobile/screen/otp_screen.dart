import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/authentication/presentation/verify_mobile/verify_cubit/otp_cubit.dart';
import 'package:lost_app/authentication/presentation/verify_mobile/widgets/otp_dialog.dart';
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

class VerifyMobileScreen extends StatelessWidget {
  final bool isFromResetPhone;

  const VerifyMobileScreen({required this.isFromResetPhone});

  @override
  Widget build(BuildContext context) {
    final otpCubit = BlocProvider.of<OtpCubit>(context);
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    return BlocConsumer<OtpCubit, OtpStates>(
      listener: (context, state) {
        if (state is PhoneOtpSuccess) {
          showDialog(
            context: context,
            builder: (BuildContext context) => OtpDialog(),
          );
        } else if (state is PhoneOtpError) {
          showToast(state: ToastStates.error, message: state.message);
        } else if (state is PhoneOtpTimeOut) {
          showToast(state: ToastStates.error, message: 'Time out');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
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
                  Form(
                    key: otpCubit.formKey,
                    child: PinCodeTextField(
                      appContext: context,
                      hintCharacter: '*',
                      length: 6,
                      animationType: AnimationType.fade,
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
                      controller: otpCubit.textEditingController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        isFromResetPhone
                            ? navigateTo(
                                context,
                                RouteConstant.resetPasswordRoute,
                              )
                            : showDialog(
                                context: context,
                                builder: (BuildContext context) => OtpDialog(),
                              );
                      },
                      onChanged: (value) {
                        log(value);
                      },
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
                            if (isFromResetPhone) {
                              navigateTo(
                                context,
                                RouteConstant.resetPasswordRoute,
                              );
                            } else {
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
                            otpCubit.verifyNumber(
                              phoneNumber:
                                  registerCubit.registerPhoneControl.text,
                            );
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
                          5,
                          // 59,
                          const Duration(milliseconds: 1000),
                          () =>
                              otpCubit.changeFlatButtonText(changeText: false),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
