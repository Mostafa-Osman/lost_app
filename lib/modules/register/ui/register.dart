import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/login/ui/login.dart';
import 'package:lost_app/modules/register/register_cubit/cubit.dart';
import 'package:lost_app/modules/register/register_cubit/states.dart';
import 'package:lost_app/modules/route/route_constants.dart';
import 'package:lost_app/modules/verify_mobile/ui/Verify_mobile.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final registerNameControl = TextEditingController();
  final registerEmailControl = TextEditingController();
  final registerPhoneControl = TextEditingController();
  final registerPasswordControl = TextEditingController();
  final registerConfirmPasswordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SafeArea(
              child: Column(
                children: [
                  // logo of page
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      child: SvgPicture.asset('assets/images/logo.svg'),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  text to display name
                            TextClass(text: 'الاسم'),
                            // Text form field to enter Name
                            TextFormFieldClass(
                              textHint: 'ادخل اسمك',
                              controller: registerNameControl,
                              validator: (value) =>
                                  value!.isEmpty ? 'من فضلك ادخل اسمك' : null,
                            ),
                            // Sized Box
                            SizedBox(height: 20),
                            //  text phone number
                            TextClass(text: 'رقم الهاتف'),
                            // Text form field to enter phone number
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
                            // Sized Box
                            SizedBox(height: 20),
                            //  text to display email
                            TextClass(text: 'البريد الالكتروني (اختياري)'),
                            // Text form field to enter email
                            TextFormFieldClass(
                              textHint: 'ادخل بريدك الالكتروني',
                              controller: registerEmailControl,
                              validator: (value) =>
                                  (value!.length>0 && !value.contains('@'))
                                      ? 'البريد الالكتروني الذي ادخلته غير صحيح'
                                      : null,
                            ),
                            // Sized Box
                            SizedBox(height: 20),
                            //  text to display password
                            TextClass(text: 'كلمه المرور'),
                            // Text form field to enter password
                            TextFormFieldClass(
                              textHint: 'ادخل كلمه المرور',
                              controller: registerPasswordControl,
                              obscureText: cubit.isVisibility,
                              suffixIcon: IconButton(
                                  onPressed: () => cubit.visibilityPassword(),
                                  icon: cubit.isVisibility
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              validator: (value) => value!.isEmpty
                                  ? 'من فضلك ادخل كلمه المرور'
                                  : (value.length < 8)
                                      ? 'كلمه المرور اقل من 8 احرف'
                                      : null,
                            ),
                            // Sized Box
                            SizedBox(height: 20),
                            //  Text to  confirm password
                            TextClass(text: 'تأكيد كلمه المرور '),
                            //  Text form field to confirm password
                            TextFormFieldClass(
                              textHint: ' اعد تأكيد ادخل كلمه المرور',
                              controller: registerConfirmPasswordControl,
                              obscureText: cubit.confirmNotVisible,
                              suffixIcon: IconButton(
                                  onPressed: () =>
                                      cubit.confirmVisibilityPassword(),
                                  icon: cubit.confirmNotVisible
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              validator: (value) => value!.isEmpty
                                  ? 'من فضلك اعد ادخال كلمه المرور'
                                  : (value != registerPasswordControl.text)
                                      ? 'كلمه المرور غير متطابق'
                                      : null,
                            ),
                            // Sized Box
                            SizedBox(height: 30),
                            // button to submit register
                            ButtonTheme(
                                minWidth: double.infinity,
                                height: 50,
                                child: RaisedButtonClass(
                                  text: 'إنشاء',
                                  textColor: white,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate())
                                      navigateWithArgument(
                                          context, RouteConstant.verifyRote
                                          ,false
                                      );
                                  },
                                )),
                            // Sized Box
                            SizedBox(height: 10),
                            // Text button class to   navigate to login page if you have account
                            TextButtonClass(
                                onPressed: () =>
                                    navigatorAndFinish(context, RouteConstant.loginRoute),
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
      ),
    );
  }
}
