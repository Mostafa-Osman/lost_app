import 'package:flutter/material.dart';
import 'package:lost_app/modules/login/Verify_mobile.dart';
import 'package:lost_app/modules/login/login.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  var registerNameControl = TextEditingController();
  var registerEmailControl = TextEditingController();
  var registerPhoneControl = TextEditingController();
  var registerPasswordControl = TextEditingController();
  var registerConfirmPasswordControl = TextEditingController();

  bool notVisible = true;
  bool confirmNotVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextClass(text: 'الاسم', fontSize: 15),
                          TextFormFieldClass(
                            textHint: 'ادخل اسمك',
                            controller: registerNameControl,
                            validator: (value) =>
                                value!.isEmpty ? 'من فضلك ادخل اسمك' : null,
                          ),
                          SizedBox(height: 20),
                          TextClass(text: 'رقم الهاتف', fontSize: 15),
                          TextFormFieldClass(
                            textHint: 'ادخل رقم هاتفك',
                            controller: registerPhoneControl,
                            keyboardType: TextInputType.numberWithOptions(),
                            validator: (value) => value!.isEmpty
                                ? 'من فضلك ادخل رقم هاتفك'
                                : (value.length != 11)
                                    ? 'رقم الهاتف غير صحيح'
                                    : null,
                          ),
                          SizedBox(height: 20),
                          TextClass(
                              text: 'البريد الالكتروني (اختياري)',
                              fontSize: 15),
                          TextFormFieldClass(
                            textHint: 'ادخل بريدك الالكتروني',
                            controller: registerEmailControl,
                            validator: (value) => value!.isEmpty
                                ? 'من فضلك ادخل البريد الالكتروني'
                                : (!value.contains('@'))
                                    ? 'البريد الالكتروني الذي ادخلته غير صحيح'
                                    : null,
                          ),
                          SizedBox(height: 20),
                          TextClass(text: 'كلمه المرور', fontSize: 15),
                          TextFormFieldClass(
                            textHint: 'ادخل كلمه المرور',
                            controller: registerPasswordControl,
                            obscureText: notVisible,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    notVisible = !notVisible;
                                  });
                                },
                                icon: notVisible
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
                            controller: registerConfirmPasswordControl,
                            obscureText: confirmNotVisible,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    confirmNotVisible = !confirmNotVisible;
                                  });
                                },
                                icon: confirmNotVisible
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off)),
                            validator: (value) => value!.isEmpty
                                ? 'من فضلك اعد ادخال كلمه المرور'
                                : (value != registerPasswordControl.text)
                                    ? 'كلمه المرور غير متطابق'
                                    : null,
                          ),
                          SizedBox(height: 30),
                          ButtonTheme(
                              minWidth: double.infinity,
                              height: 50,
                              child: RaisedButtonClass(
                                text: 'إنشاء',
                                textColor: white,
                                onPressed: () {
                                  if (_formKey.currentState!.validate())
                                    navigateTo(
                                        context, VerifyMobileScreen(false));
                                },
                              )),
                          SizedBox(height: 10),
                          TextButtonClass(
                              onPressed: () {
                                navigatorAndFinish(context, LoginScreen());
                              },
                              text: 'هل لديك حساب بالفعل ؟',
                              textColor: mainColor),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
