import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/data/local/cash_helper.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/constant.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/exceptions/phone_validation.dart';
import 'package:lost_app/shared/styles/color.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      backgroundColor: white,
      body: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CacheHelper.saveData(
              key: 'token',
              value: loginCubit.userData.token,
            ).then((value) {
              token = loginCubit.userData.token!;
              navigatorAndFinish(context, RouteConstant.homeLayoutRoute);
            });
          } else if (state is LoginError) {
            showToast(state: ToastStates.error, message: state.message);
          }
        },
        builder: (context, state) => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Container(
                width: 500,
                height: size.height,
                color: white,
                child: Stack(
                  children: [
                    SvgPicture.asset('assets/images/login.svg'),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: size.height / 1.75,
                        child: Form(
                          key: loginCubit.formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextClass(
                                  text: 'رقم الهاتف',
                                ),
                                TextFormFieldClass(
                                  textHint: 'ادخل رقم هاتفك',
                                  controller: loginCubit.loginPhoneControl,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) => value!.isEmpty
                                      ? 'من فضلك ادخل رقم هاتفك'
                                      : (value.length != 11)
                                          ? 'يجيب ان يكون رقم الهاتف مكون من 11 رقم'
                                          : !checkPhoneValidate(
                                              phoneNumber: loginCubit
                                                  .loginPhoneControl.text,
                                            )
                                              ? 'رقم الهاتف غير صحيح'
                                              : null,
                                ),
                                const SizedBox(height: 15),
                                const TextClass(
                                  text: 'كلمه المرور',
                                ),
                                TextFormFieldClass(
                                  textHint: 'ادخل كلمه المرور',
                                  controller: loginCubit.loginPasswordControl,
                                  suffixIcon: IconButton(
                                    onPressed: () =>
                                        loginCubit.loginVisibilityPassword(),
                                    icon: loginCubit.isVisibility
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                  ),
                                  obscureText: loginCubit.isVisibility,
                                  validator: (value) => value!.isEmpty
                                      ? 'من فضلك ادخل كلمه المرور'
                                      : (value.length < 8)
                                          ? 'كلمه المرور اقل من 8 احرف'
                                          : null,
                                ),
                                TextButtonClass(
                                  onPressed: () => navigateTo(
                                    context,
                                    RouteConstant.phoneNumberRoute,
                                  ),
                                  text: 'هل نسيت كلمه المرور ؟ ',
                                  textColor: lightGrey,
                                ),
                                // Sized Box with height 10
                                const SizedBox(height: 10),
                                // Button to submit (go to home screen)
                                CustomButton(
                                  onPressed: () {
                                    if (loginCubit.formKey.currentState!
                                        .validate()) {
                                      loginCubit.login();
                                    }
                                  },
                                  text: 'تسجيل الدخول',
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextClass(
                                          text: 'ليس لديك حساب ؟',
                                          textColor: lightGrey,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextButtonClass(
                                          onPressed: () {
                                            navigatorAndFinish(
                                              context,
                                              RouteConstant.registerRoute,
                                            );
                                          },
                                          text: 'إنشاء حساب',
                                          fontSize: 18,
                                          textColor: mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
