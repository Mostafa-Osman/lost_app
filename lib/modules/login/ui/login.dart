import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/login/login_cubit/login_cubit.dart';
import 'package:lost_app/modules/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController loginPhoneControl = TextEditingController();
  final TextEditingController loginPasswordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) => {},
      builder: (context, state) => Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              // Container of all screen
              child: Container(
                width: 500,
                height: size.height,
                color: white,
                // stack to put text fields (phone number and password) on the end of logo
                child: Stack(
                  children: [
                    // logo (lost) of login page
                    SvgPicture.asset('assets/images/login.svg'),
                    // Align to alignment fields (phone number and password) on the end of logo
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: size.height / 1.75,
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //  text phone number
                                  const TextClass(
                                    text: 'رقم الهاتف',
                                  ),
                                  // Text form field to enter phone number
                                  TextFormFieldClass(
                                    textHint: 'ادخل رقم هاتفك',
                                    controller: loginPhoneControl,
                                    // keyboardType:
                                    //        TextInputType.numberWithOptions(),
                                    validator: (value) => value!.isEmpty
                                        ? 'من فضلك ادخل رقم هاتفك'
                                        : (value.length != 11)
                                            ? 'رقم الهاتف غير صحيح'
                                            : null,
                                  ),
                                  // Sized Box with height 15
                                  const SizedBox(height: 15),
                                  //  text password
                                  const   TextClass(
                                    text: 'كلمه المرور',
                                  ),
                                  // Text form field to enter password
                                  TextFormFieldClass(
                                    textHint: 'ادخل كلمه المرور',
                                    controller: loginPasswordControl,
                                    suffixIcon: IconButton(
                                        onPressed: () =>
                                            cubit.loginVisibilityPassword(),
                                        icon: cubit.isVisibility
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off),),
                                    obscureText: cubit.isVisibility,
                                    validator: (value) => value!.isEmpty
                                        ? 'من فضلك ادخل كلمه المرور'
                                        : (value.length < 8)
                                            ? 'كلمه المرور اقل من 8 احرف'
                                            : null,
                                  ),
                                  // Text button forget password
                                  TextButtonClass(
                                    onPressed: () => navigateTo(context,
                                        RouteConstant.phoneNumberRoute,),
                                    text: 'هل نسيت كلمه المرور ؟ ',
                                    textColor: lightGrey,
                                  ),
                                  // Sized Box with height 10
                                  const SizedBox(height: 10),
                                  // Button to submit (go to home screen)
                                  CustomButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              navigateTo(
                                                  context,
                                                  RouteConstant
                                                      .homeLayoutRoute,);
                                            }
                                          },
                                          text: 'تسجيل الدخول',
                                         ),
                                  // if do not have account to go sign up screen
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text do not have account
                                        Expanded(
                                          child: TextClass(
                                            text: 'ليس لديك حساب ؟',
                                            textColor: lightGrey,
                                          ),
                                        ),
                                        // Text button to go  sign up screen

                                        Expanded(
                                            child: TextButtonClass(
                                          onPressed: () => navigatorAndFinish(
                                              context,
                                              RouteConstant.registerRoute,),
                                          text: 'إنشاء حساب',
                                          fontSize: 18,
                                          textColor: mainColor,
                                        ),),
                                      ],
                                    ),
                                  ),
                                ],),
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
