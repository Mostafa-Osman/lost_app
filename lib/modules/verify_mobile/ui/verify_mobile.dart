import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/route/route_constants.dart';
import 'package:lost_app/modules/verify_mobile/verify_cubit/verify_cubit.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/timer.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyMobileScreen extends StatelessWidget {
  final bool isFromResetPhone;

  VerifyMobileScreen({required this.isFromResetPhone});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCubit, VerifyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = VerifyCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const TextClass(text: 'لقد ارسلنا اليك رمز التاكيد', fontSize: 25),
                  const SizedBox(height: 10),
                  TextClass(
                      text:
                          'تاكد من حصولك على رساله نصيه على رقم 010******55 تحتوي على رمز التاكيد',
                      textColor: lightGrey,),
                  const SizedBox(height: 50),
                  //pin code design
                  Form(
                    key: _formKey,
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
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        isFromResetPhone
                            ? navigateTo(
                                context, RouteConstant.resetPasswordRoute,)
                            : showDialog(
                                context: context,
                                builder: (BuildContext context) => Dialog(),);
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
                                isFromResetPhone
                                    ? navigateTo(context,
                                        RouteConstant.resetPasswordRoute,)
                                    : showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Dialog(),);
                              },),),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!cubit.isTimerOn)
                        TextClass(
                            text: 'لم يصلك الرمز ؟', textColor: lightGrey,),
                      TextButtonClass(
                        text: cubit.flatButtonText,
                        textColor: mainColor,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialogClass(
                              height: 240.0,
                              widget: const TextClass(
                                  text: 'تم اعاده ارسال رمز التاكيد',
                                  fontSize: 20,),
                              bottomWidget: TextButtonClass(
                                text: 'تم',
                                fontSize: 25,
                                textColor: mainColor,
                                onPressed: () {
                                  cubit.changeFlatButtonText( changeText: true);
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      if (cubit.isTimerOn)
                        TimerClass(59, const Duration(milliseconds: 1000),
                            () => cubit.changeFlatButtonText(changeText: false),),
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

class Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialogClass(
      height: 260.0,
      widget: Column(
        children: const [
          TextClass(
            text: 'تهانينا لقد اتممت إنشاء',
          ),
          TextClass(
            text: 'الحساب بنجاح',
          ),
        ],
      ),
      bottomWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtonClass(
            onPressed: () => navigateTo(context, RouteConstant.homeLayoutRoute),
            text: 'الي الصفحه الرئيسيه',
            fontSize: 20,
          ),
          TimerClass(5, const Duration(milliseconds: 1000),
              () => navigateTo(context, RouteConstant.homeLayoutRoute),)
        ],
      ),
    );
  }
}
