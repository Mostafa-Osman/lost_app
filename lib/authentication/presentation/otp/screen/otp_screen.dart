import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/otp_cubit/otp_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/widgets/otp_dialog.dart';
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

class OtpScreen extends StatefulWidget {
  const OtpScreen();

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)!.settings.arguments! as List;
      BlocProvider.of<OtpCubit>(context).fillData(args);
      BlocProvider.of<OtpCubit>(context).initService(
        mobile: args[0].toString(),
        type: args[3] as String,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final otpCubit = BlocProvider.of<OtpCubit>(context);
    final arguments = ModalRoute.of(context)!.settings.arguments! as List;
    return Scaffold(
      body: BlocConsumer<OtpCubit, OtpStates>(
        listener: (BuildContext context, state) {
          if (state is OtpError) {
            showToast(
              message: 'رمز التاكيد غير صحيح',
              state: ToastStates.error,
            );
          }
          if (state is OtpSignUp) {
            otpCubit.register();
          }
          if (state is RegisterSuccess) {
            BlocProvider.of<LoginCubit>(context).login(
              password: otpCubit.pass,
              phone: otpCubit.phone,
            );
            showDialog(
              context: context,
              builder: (BuildContext context) => OtpDialog(),
            );
          } else if (state is RegisterError) {
            showToast(
              message: state.message,
              state: ToastStates.error,
            );
          }
          if (state is OtpForgetPass) {
            navigatorAndFinish(context, RouteConstant.resetPasswordRoute);
          }
        },
        builder: (context, state) {
          if (state is RegisterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: SafeArea(
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
                            'تاكد من حصولك على رساله نصيه تحتوي على رمز التاكيد',
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
                            backgroundColor: Colors.white,
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
                              activeFillColor: mainColor,
                              inactiveFillColor: white,
                            ),
                            cursorColor: black,
                            enableActiveFill: true,
                            keyboardType: TextInputType.number,
                            onCompleted: (v) {
                              otpCubit.verifyOTP(v);
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
                                otpCubit.verifyOTP(otpCubit.otpCode);
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
                                otpCubit.requestPhone(
                                  otpCubit.phone,
                                  arguments[1].toString(),
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
                            },
                          ),
                          if (otpCubit.isTimerOn)
                            TimerClass(
                              seconds: 59,
                              interval: const Duration(milliseconds: 1000),
                              onFinished: () => otpCubit.changeFlatButtonText(
                                changeText: false,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
