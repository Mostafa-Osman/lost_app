import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost_app/home/bottom_navigation_bar.dart';
import 'package:lost_app/modules/login/reset_password.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/timer.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyMobileScreen extends StatefulWidget {
  final bool isForget;

  const VerifyMobileScreen(this.isForget);

  @override
  _VerifyMobileScreenState createState() => _VerifyMobileScreenState(isForget);
}

class _VerifyMobileScreenState extends State<VerifyMobileScreen> {
  final _formKey = GlobalKey<FormState>();
  final bool isForget;

  _VerifyMobileScreenState(this.isForget);

  StreamController<ErrorAnimationType>? errorController;

  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  bool resend = false;
  String reSendCode = 'اعادة الارسال';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: Column(
            children: [
              TextClass(text: 'لقد ارسلنا اليك رمز التاكيد', fontSize: 25),
              SizedBox(height: 10),
              TextClass(
                  text:
                      'تاكد من حصولك على رساله نصيه على رقم 010******55 تحتوي على رمز التاكيد',
                  textColor: Colors.black38),
              SizedBox(height: 50),
              pinCodeFields(context),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonTheme(
                      minWidth: double.infinity,
                      height: 50,
                      child: RaisedButtonClass(
                          text: 'التالي',
                          textColor: white,
                          onPressed: () {
                            if (isForget)
                              navigateTo(context, ResetPassword());
                            else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialogClass(
                                  height: 260.0,
                                  widget: Column(
                                    children: [
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
                                        onPressed: () =>
                                            navigateTo(context, HomeScreen()),
                                        text: 'الي الصفحه الرئيسيه',
                                        fontSize: 20,
                                        textColor: mainColor,
                                      ),
                                      TimerClass(
                                          5,
                                          Duration(milliseconds: 1000),
                                          () =>
                                              navigateTo(context, HomeScreen()))
                                    ],
                                  ),
                                ),
                              );
                            }
                          })),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!resend)
                    TextClass(
                        text: 'لم يصلك الرمز ؟', textColor: Colors.black54),
                  TextButtonClass(
                    text: reSendCode,
                    textColor: mainColor,
                    onPressed: () {
                      if (resend) return;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialogClass(
                          height: 235.0,
                          widget: TextClass(
                              text: 'تم اعاده ارسال رمز التاكيد',
                              textColor: mainColor),
                          bottomWidget: TextButtonClass(
                            text: 'تم',
                            textColor: mainColor,
                            onPressed: () {
                              if (resend) return;
                              setState(() {
                                resend = true;
                                reSendCode =
                                    'لارسال الرمز مره اخري برجاء الانتظار';
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  if (resend)
                    TimerClass(59, Duration(milliseconds: 1000), () {
                      setState(() {
                        resend = false;
                        reSendCode = 'اعادة الارسال';
                      });
                    }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Form pinCodeFields(context) {
    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
          child: PinCodeTextField(
            appContext: context,
            hintCharacter: '*',
            pastedTextStyle: TextStyle(
              color: mainColor,
              fontWeight: FontWeight.bold,
            ),
            length: 6,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 50,
              fieldWidth: 43,
              inactiveColor: Colors.grey,
              selectedFillColor: mainColor,
              selectedColor: Colors.grey,
              activeFillColor: white,
              inactiveFillColor:white,
            ),
            cursorColor: Colors.black,
            animationDuration: Duration(milliseconds: 300),
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: textEditingController,
            keyboardType: TextInputType.number,
            boxShadows: [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black12,
                blurRadius: 10,
              )
            ],
            onCompleted: (v) {
              print("Completed");
            },
            onChanged: (value) {
              print(value);
              setState(() {
                currentText = value;
              });
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              return true;
            },
          )),
    );
  }
}
