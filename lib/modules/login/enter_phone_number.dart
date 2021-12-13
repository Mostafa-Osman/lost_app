import 'package:flutter/material.dart';
import 'package:lost_app/modules/login/Verify_mobile.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PhoneNumberScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    TextClass(
                      text: 'ادخل رقم هاتفك',
                      fontSize: 30.0,
                    ),
                    SizedBox(height: 10),
                    TextClass(
                      text: 'ادخا رقم هاتفك لنتمكن من ارسال رمز التاكيد اليك',
                      fontSize: 20.0,
                      textColor: lightGrey,
                    ),
                    SizedBox(height: 50),
                    Container(
                      alignment: Alignment.topRight,
                      child: TextClass(
                        text: 'رقم الهاتف',
                        fontSize: 20.0,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormFieldClass(
                        controller: textEditingController,
                        textHint: 'ادخل رقم هاتفك',
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) return 'من فضلك ادخل رقم هاتفك';
                          if (value.length != 11) return 'رقم الهاتف غير صحيح';
                          return null;
                        },
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
                                  navigateTo(context, VerifyMobileScreen(true));
                              },
                            )),
                      ),
                    ),
                  ]),
            )));
  }
}
