import 'package:flutter/material.dart';
import 'package:lost_app/modules/login/login.dart';
import 'package:lost_app/shared/components/component.dart';

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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultText(text: 'الاسم', fontSize: 15),
                          buildContainerTextFromField(
                            defaultTextFromField(
                                textHint: 'ادخل اسمك',
                                hintColor: Colors.black38,
                                controller: registerNameControl,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'من فضلك ادخل اسمك';
                                  return null;
                                }),
                          ),
                          SizedBox(height: 20),
                          defaultText(text: 'رقم الهاتف', fontSize: 15),
                          buildContainerTextFromField(
                            defaultTextFromField(
                                textHint: 'ادخل رقم هاتفك',
                                hintColor: Colors.black38,
                                controller: registerPhoneControl,
                                keyboardType: TextInputType.numberWithOptions(),
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'من فضلك ادخل رقم هاتفك';
                                  else if (value.length != 11)
                                    return 'رقم الهاتف غير صحيح';
                                  return null;
                                }),
                          ),
                          SizedBox(height: 20),
                          defaultText(
                              text: 'البريد الالكتروني (اختياري)',
                              fontSize: 15),
                          buildContainerTextFromField(
                            defaultTextFromField(
                                textHint: 'ادخل بريدك الالكتروني',
                                hintColor: Colors.black38,
                                controller: registerEmailControl,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'من فضلك ادخل البريد الالكتروني';
                                  else if (!value.contains('@'))
                                    return 'البريد الالكتروني الذي ادخلته غير صحيح';
                                  return null;
                                }),
                          ),
                          SizedBox(height: 20),
                          defaultText(text: 'كلمه المرور', fontSize: 15),
                          buildContainerTextFromField(
                            defaultTextFromField(
                              textHint: 'ادخل كلمه المرور',
                              hintColor: Colors.black38,
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
                          ),
                          SizedBox(height: 20),
                          defaultText(text: 'تأكيد كلمه المرور ', fontSize: 15),
                          buildContainerTextFromField(
                            defaultTextFromField(
                              textHint: ' اعد تأكيد ادخل كلمه المرور',
                              hintColor: Colors.black38,
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
                          ),
                          SizedBox(height: 30),
                          ButtonTheme(
                              minWidth: double.infinity,
                              height: 50,
                              child: defaultRaisedButton(
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
                              //not work
                              // navigatorAndFinish(context, LoginScreen());
                            },
                            child: defaultText(
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

  Container buildContainerTextFromField(child) {
    return Container(height: 50, child: child);
  }
}
