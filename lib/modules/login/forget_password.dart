import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:lost_app/shared/components/component.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                defaultText(text: 'لقد ارسلنا اليك رمز التاكيد', fontSize: 25),
                SizedBox(height: 10),
                defaultText(
                    text:
                        'تاكد من حصولك على رساله نصيه على رقم 010******55 تحتوي على رمز التاكيد',
                    fontSize: 18,
                    textColor: Colors.black38),
                SizedBox(height: 50),
                VerificationCode(
                  textStyle: TextStyle(fontSize: 20.0, color: Colors.grey[900]),
                  keyboardType: TextInputType.number,
                  underlineColor: const Color.fromRGBO(42, 185, 237, 1),
                  length: 4,
                  itemSize: 50,
                  onCompleted: (String value) {},
                  onEditing: (bool value) {},
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonTheme(
                        minWidth: double.infinity,
                        height: 50,
                        child: defaultRaisedButton(
                          text: 'التالي',
                          textColor: Colors.white,
                          onPressed: () {},
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultText(text: 'لم يصلك الرمز ؟'),
                    FlatButton(
                      onPressed: () => showAlertDialog(context),
                      child: defaultText(
                        text: 'اعادة الارسال',
                        textColor: Color.fromRGBO(42, 185, 237, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => defaultAlertDialog(
        content: Container(
          height: 235,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          ),
          child: Column(
            children: [
              SizedBox(height: 25),
              defaultText(
                  text: 'تم اعاده ارسال رمز التاكيد',
                  fontWeight: FontWeight.normal),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/icons/done.png',
                ),
              ),
              myDivider(
                  color: Color.fromRGBO(200, 218, 245, 1), thickness: 2.0),
              Container(
                width: double.infinity,
                child: defaultTextButton(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  text: 'تم',
                  fontSize: 20,
                  textColor: Color.fromRGBO(42, 185, 237, 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
