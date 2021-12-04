import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/component.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/lost.svg',
                ),
              ),
              SizedBox(height: 10),
              Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextFormField(
                          labelText: 'رقم الهاتف', hintText: 'ادخل رقم هاتفك'),
                      SizedBox(height: 10),
                      buildTextFormField(
                          labelText: 'كلمه المرور',
                          hintText: 'ادخل كلمه المرور',
                          suffixIcon: Icon(Icons.visibility)),
                      FlatButton(
                          onPressed: () {},
                          child: defaultText(
                            text: 'هل نسيت كلمه المرور ؟ ',
                            textColor: Color.fromRGBO(42, 185, 237, 1),
                          )),
                      SizedBox(height: 10),
                      ButtonTheme(
                          minWidth: double.infinity,
                          height: 50,
                          child: defaultRaisedButton(
                              onPressed: () {},
                              text: 'تسجيل الدخول',
                              textColor: Colors.white)),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultText(text: 'ليس لديك حساب ؟'),
                          FlatButton(
                              onPressed: () {},
                              child: defaultText(
                                text: 'إنشاء حساب',
                                textColor: Color.fromRGBO(42, 185, 237, 1),
                              )),
                        ],
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      {required labelText, required hintText, Icon? suffixIcon}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: labelText,
        hintText: hintText,
        helperStyle: TextStyle(color: Colors.grey[200]),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
