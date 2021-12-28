import 'package:flutter/material.dart';
import 'package:lost_app/modules/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PhoneNumberScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.only(top: 60.0, right: 30, left: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //  text (enter phone number)
                TextClass(
                  text: 'ادخل رقم هاتفك',
                  fontSize: 30.0,
                ),
                // Sized Box with height 10
                SizedBox(height: 10),
                //  text
                TextClass(
                  text: 'ادخل رقم هاتفك لنتمكن من ارسال رمز التاكيد اليك',
                  fontSize: 20.0,
                  textColor: lightGrey,
                ),
                // Sized Box with height 20
                SizedBox(height: 20),
                //  text (phone number)
                Container(
                  alignment: Alignment.topRight,
                  child: TextClass(
                    text: 'رقم الهاتف',
                    textAlign: TextAlign.start,
                    fontSize: 20.0,
                  ),
                ),
                // form (phone number text field)
                Form(
                  key: _formKey,
                  child: TextFormFieldClass(
                    controller: textEditingController,
                    textHint: 'ادخل رقم هاتفك',
                    keyboardType: TextInputType.phone,
                    validator: (value) => value!.isEmpty
                        ? 'من فضلك ادخل رقم هاتفك'
                        : (value.length != 11)
                        ? 'رقم الهاتف غير صحيح'
                        : null,
                  ),
                ),
                // Button to submit phone number
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:  CustomButton(
                        text: 'التالي',
                        onPressed: () {
                          if (_formKey.currentState!.validate())
                            navigateWithArgument(context, RouteConstant.verifyRote,true
                            );
                          },

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
