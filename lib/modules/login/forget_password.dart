import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost_app/home/bottom_navigation_bar.dart';
import 'package:lost_app/modules/login/login.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/divider_class.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

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
                        textColor: Colors.white,
                        onPressed: () {
                          return showAlertDialog(
                            context: context,
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
                                  onPress: () =>
                                      navigateTo(context, HomeScreen()),
                                  text: 'الي الصفحه الرئيسيه',
                                  fontSize: 20,
                                  textColor: mainColor,
                                ),
                                timer(context, 5,
                                    () => navigateTo(context, HomeScreen())),
                              ],
                            ),
                          );
                        },
                      )),
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
                    onPress: () {
                      if (resend) return;
                      showAlertDialog(
                        context: context,
                        height: 235.0,
                        widget: TextClass(
                            text: 'تم اعاده ارسال رمز التاكيد',
                            textColor: mainColor),
                        bottomWidget: TextButtonClass(
                          text: 'تم',textColor: mainColor,
                          onPress: () {
                            if (resend) return;
                            setState(() {
                              resend = true;
                              reSendCode =
                                  'لارسال الرمز مره اخري برجاء الانتظار';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                  if (resend)
                    timer(context, 59, () {
                      setState(() {
                        resend = false;
                        reSendCode = 'اعادة الارسال';
                      });
                    })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Countdown timer(context, seconds, onFinished) {
    return Countdown(
        seconds: seconds,
        build: (_, time) => TextClass(
              text: '(${time.toInt().toString()})',
              textColor: mainColor,
            ),
        interval: Duration(milliseconds: 1000),
        onFinished: onFinished);
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
              // activeColor: Colors.grey,
              selectedFillColor: mainColor,
              selectedColor: Colors.grey,
              activeFillColor: Colors.white,
              inactiveFillColor: Colors.white,
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

  showAlertDialog({context, height, widget, bottomWidget}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogClass(
        content: Container(
          width: 300,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          ),
          child: Column(
            children: [
              SizedBox(height: 25),
              widget,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/icons/done.png',
                ),
              ),
              DividerClass(
                  color: Color.fromRGBO(200, 218, 245, 1), thickness: 2.0),
              Container(width: double.infinity, child: bottomWidget)
            ],
          ),
        ),
      ),
    );
  }
}
