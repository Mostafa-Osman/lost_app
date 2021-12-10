import 'package:flutter/material.dart';
import 'package:lost_app/home/bottom_navigation_bar.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';

import 'enter_phone_number.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'من فضلك ادخل كلمه المرور';
                            else if (value.length < 8)
                              return 'كلمه المرور اقل من 8 احرف';
                            else
                              return null;
                          },
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
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'من فضلك ادخل كلمه المرور';
                            else if (value.length < 8)
                              return 'كلمه المرور اقل من 8 احرف';
                            else
                              return null;
                          },
                        ),
                      ],
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
                            textColor: Colors.white,
                            onPressed: () {
                              if (_formKey.currentState!.validate())
                                navigateTo(context, HomeScreen());
                            }),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButtonClass(
                    text: 'لست اسم المستخدم؟',
                    textColor: Colors.black26,
                    onPress: () => navigateTo(context, PhoneNumberScreen()),
                  ),
                ],
              ),
            )));
  }
}
