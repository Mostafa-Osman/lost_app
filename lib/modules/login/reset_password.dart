import 'package:flutter/material.dart';
import 'package:lost_app/modules/home_layout/home_layout.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/components/timer.dart';
import 'package:lost_app/shared/styles/color.dart';

import 'enter_phone_number.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var resetPasswordControl = TextEditingController();

  var resetConfirmPasswordControl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isVisible = false;

  bool confirmIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SafeArea(
              child: Column(
                children: [
                  TextClass(text: 'مرحبا, اسم المستخدم', fontSize: 25),
                  SizedBox(height: 50),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextClass(text: 'كلمه المرور', fontSize: 15),
                          TextFormFieldClass(
                            textHint: 'ادخل كلمه المرور',
                            controller: resetPasswordControl,
                            obscureText: isVisible,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: isVisible
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off)),
                            validator: (value) => value!.isEmpty
                                ? 'من فضلك ادخل كلمه المرور'
                                : (value.length < 8)
                                    ? 'كلمه المرور اقل من 8 احرف'
                                    : null,
                          ),
                          SizedBox(height: 20),
                          TextClass(text: 'تأكيد كلمه المرور ', fontSize: 15),
                          TextFormFieldClass(
                            textHint: ' اعد تأكيد ادخل كلمه المرور',
                            controller: resetConfirmPasswordControl,
                            obscureText: confirmIsVisible,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    confirmIsVisible = !confirmIsVisible;
                                  });
                                },
                                icon: confirmIsVisible
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off)),
                            validator: (value) => value!.isEmpty
                                ? 'من فضلك اعد ادخال كلمه المرور'
                                : (value != resetPasswordControl.text)
                                    ? 'كلمه المرور غير متطابق'
                                    : null,
                          ),
                        ],
                      ),
                    ),
                  ),
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
                              if (_formKey.currentState!.validate())
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialogClass(

                                    height: 260.0,
                                    widget: Column(
                                      children: [
                                        TextClass(
                                          text: 'تهانينا لقد قمت بإعاده تعيين',
                                        ),
                                        TextClass(
                                          text: 'كلمه المرور بنجاح',
                                        ),
                                      ],
                                    ),
                                    bottomWidget: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButtonClass(
                                          onPressed: () =>
                                              navigateTo(context, HomeLayout()),
                                          text: 'الي الصفحه الرئيسيه',
                                          fontSize: 20,
                                          textColor: mainColor,
                                        ),
                                        TimerClass(
                                            5,
                                            Duration(milliseconds: 1000),
                                            () => navigatorAndFinish(
                                                context, HomeLayout()))
                                      ],
                                    ),
                                  ),
                                );
                            }),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButtonClass(
                    text: 'لست اسم المستخدم؟',
                    textColor: lightGrey,
                    onPressed: () => navigateTo(context, PhoneNumberScreen()),
                  ),
                ],
              ),
            )));
  }
}
