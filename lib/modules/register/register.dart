import 'package:flutter/material.dart';
import 'package:lost_app/modules/login/login.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';

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

  bool isVisible = false;
  bool confirmIsVisible = false;

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
                    padding:
                        const EdgeInsets.only(right: 10,left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextClass(text: 'الاسم', fontSize: 15),
                          TextFormFieldClass(
                              textHint: 'ادخل اسمك',
                              controller: registerNameControl,
                              validator: (value) {
                                if (value!.isEmpty) return 'من فضلك ادخل اسمك';
                                return null;
                              }),
                          SizedBox(height: 20),
                          TextClass(text: 'رقم الهاتف', fontSize: 15),
                          TextFormFieldClass(
                              textHint: 'ادخل رقم هاتفك',
                              controller: registerPhoneControl,
                              keyboardType: TextInputType.numberWithOptions(),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'من فضلك ادخل رقم هاتفك';
                                else if (value.length != 11)
                                  return 'رقم الهاتف غير صحيح';
                                return null;
                              }),
                          SizedBox(height: 20),
                          TextClass(
                              text: 'البريد الالكتروني (اختياري)',
                              fontSize: 15),
                          TextFormFieldClass(
                              textHint: 'ادخل بريدك الالكتروني',
                              controller: registerEmailControl,
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'من فضلك ادخل البريد الالكتروني';
                                else if (!value.contains('@'))
                                  return 'البريد الالكتروني الذي ادخلته غير صحيح';
                                return null;
                              }),
                          SizedBox(height: 20),
                          TextClass(text: 'كلمه المرور', fontSize: 15),
                          TextFormFieldClass(
                            textHint: 'ادخل كلمه المرور',
                            controller: registerPasswordControl,
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
                            controller: registerConfirmPasswordControl,
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
                          SizedBox(height: 30),
                          ButtonTheme(
                              minWidth: double.infinity,
                              height: 50,
                              child: RaisedButtonClass(
                                text: 'إنشاء',
                                textColor: Colors.white,
                                onPressed: () {
                                  if (_formKey.currentState!.validate())
                                    print('okey');
                                },
                              )),
                          SizedBox(height: 10),
                          FlatButton(
                            onPressed: () {
                              navigatorAndFinish(context, LoginScreen());
                            },
                            child: TextClass(
                                text: 'هل لديك حساب بالفعل ؟',
                                textColor: Color.fromRGBO(42, 185, 237, 1)),
                          )
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
