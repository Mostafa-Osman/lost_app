import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/register/regisster_cubit/cubit.dart';
import 'package:lost_app/modules/register/regisster_cubit/states.dart';
import 'package:lost_app/modules/verfiy_mobile/ui/Verify_mobile.dart';
import 'package:lost_app/modules/login/ui/login.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class RegisterScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  var registerNameControl = TextEditingController();
  var registerEmailControl = TextEditingController();
  var registerPhoneControl = TextEditingController();
  var registerPasswordControl = TextEditingController();
  var registerConfirmPasswordControl = TextEditingController();

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
                              validator: (value) =>
                                  (!value!.isEmpty && !value.contains('@'))
                                      ? 'البريد الالكتروني الذي ادخلته غير صحيح'
                                      : null,
                            ),
                            SizedBox(height: 20),
                            TextClass(text: 'كلمه المرور', fontSize: 15),
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
                            SizedBox(height: 20),
                            TextClass(text: 'تأكيد كلمه المرور ', fontSize: 15),
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
      ),
    );
  }
}
