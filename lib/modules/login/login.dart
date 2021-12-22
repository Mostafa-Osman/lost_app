import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/home_layout/home_layout.dart';
import 'package:lost_app/modules/login/login_cubit/cubit.dart';
import 'package:lost_app/modules/login/login_cubit/states.dart';
import 'package:lost_app/modules/register/register.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

import 'enter_phone_number.dart';

class LoginScreen extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  var loginPhoneControl = TextEditingController();
  var loginPasswordControl = TextEditingController();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cubit=LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) => {},
      builder: (context, state) => Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: size.height, //770,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: size.height / 1.75,
                      width: double.infinity,
                      child:SvgPicture.asset('assets/images/login.svg'),

                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: size.height / 1.7,
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextClass(
                                    text: 'رقم الهاتف',
                                  ),
                                  TextFormFieldClass(
                                    textHint: 'ادخل رقم هاتفك',
                                    controller: loginPhoneControl,
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    validator: (value) => value!.isEmpty
                                        ? 'من فضلك ادخل رقم هاتفك'
                                        : (value.length != 11)
                                            ? 'رقم الهاتف غير صحيح'
                                            : null,
                                  ),
                                  SizedBox(height: 15),
                                  TextClass(
                                    text: 'كلمه المرور',
                                  ),
                                  TextFormFieldClass(
                                    textHint: 'ادخل كلمه المرور',
                                    controller: loginPasswordControl,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          cubit.visibilityPassword();
                                          // setState(() {
                                          //   notVisible = !notVisible;
                                          // });
                                        },
                                        icon: cubit.isVisibility
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off)),
                                    obscureText: cubit.isVisibility,
                                    validator: (value) => value!.isEmpty
                                        ? 'من فضلك ادخل كلمه المرور'
                                        : (value.length < 8)
                                            ? 'كلمه المرور اقل من 8 احرف'
                                            : null,
                                  ),
                                  TextButtonClass(
                                    onPressed: () => navigateTo(
                                        context, PhoneNumberScreen()),
                                    text: 'هل نسيت كلمه المرور ؟ ',
                                    textColor: lightGrey,
                                  ),
                                  SizedBox(height: 10),
                                  ButtonTheme(
                                      minWidth: double.infinity,
                                      height: 50,
                                      child: RaisedButtonClass(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate())
                                              navigateTo(context, HomeLayout());
                                          },
                                          text: 'تسجيل الدخول',
                                          textColor: white)),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: TextClass(
                                            text: 'ليس لديك حساب ؟',
                                            textColor: lightGrey,
                                          ),
                                        ),
                                        Expanded(
                                          child: TextButton(
                                              onPressed: () =>
                                                  navigatorAndFinish(context,
                                                      RegisterScreen()),
                                              child: TextClass(
                                                text: 'إنشاء حساب',
                                                textColor: mainColor,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
