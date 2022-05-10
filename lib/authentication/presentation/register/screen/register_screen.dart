import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';

import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {},
     builder: (context, state) {
      //   if (state is RegisterError) {
      //     return Center(
      //       child: Text(state.message),
      //     );
      //   } else if (state is RegisterLoading) {
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   } else {
           return
              SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SafeArea(
                  child: Column(
                    children: [
                      // logo of page
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: SvgPicture.asset('assets/images/logo.svg'),
                        ),
                      ),
                      Form(
                        key: registerCubit.formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //  text to display name
                              const TextClass(text: 'الاسم'),
                              // Text form field to enter Name
                              TextFormFieldClass(
                                textHint: 'ادخل اسمك',
                                controller: registerCubit.registerNameControl,
                                validator: (value) =>
                                    value!.isEmpty ? 'من فضلك ادخل اسمك' : null,
                              ),
                              // Sized Box
                              const SizedBox(height: 20),
                              //  text phone number
                              const TextClass(text: 'رقم الهاتف'),
                              // Text form field to enter phone number
                              TextFormFieldClass(
                                textHint: 'ادخل رقم هاتفك',
                                controller: registerCubit.registerPhoneControl,
                                // keyboardType: const TextInputType.numberWithOptions(),
                                validator: (value) => value!.isEmpty
                                    ? 'من فضلك ادخل رقم هاتفك'
                                    : (value.length != 11)
                                        ? 'رقم الهاتف غير صحيح'
                                        : null,
                              ),
                              // Sized Box
                              const SizedBox(height: 20),
                              //  text to display email
                              const TextClass(
                                text: 'البريد الالكتروني (اختياري)',
                              ),
                              // Text form field to enter email
                              TextFormFieldClass(
                                textHint: 'ادخل بريدك الالكتروني',
                                controller: registerCubit.registerEmailControl,
                                validator: (value) => (value!.isNotEmpty &&
                                        !value.contains('@') &&
                                        !value.contains('.com'))
                                    ? 'البريد الالكتروني الذي ادخلته غير صحيح'
                                    : null,
                              ),
                              // Sized Box
                              const SizedBox(height: 20),
                              //  text to display password
                              const TextClass(text: 'كلمه المرور'),
                              // Text form field to enter password
                              TextFormFieldClass(
                                textHint: 'ادخل كلمه المرور',
                                controller:
                                    registerCubit.registerPasswordControl,
                                obscureText: registerCubit.isVisibility,
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      registerCubit..visibilityPassword(),
                                  icon: registerCubit.isVisibility
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                                validator: (value) => value!.isEmpty
                                    ? 'من فضلك ادخل كلمه المرور'
                                    : (value.length < 8)
                                        ? 'كلمه المرور اقل من 8 احرف'
                                        : null,
                              ),
                              // Sized Box
                              const SizedBox(height: 20),
                              //  Text to  confirm password
                              const TextClass(text: 'تأكيد كلمه المرور '),
                              //  Text form field to confirm password
                              TextFormFieldClass(
                                textHint: ' اعد تأكيد ادخل كلمه المرور',
                                controller: registerCubit
                                    .registerConfirmPasswordControl,
                                obscureText: registerCubit.confirmNotVisible,
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      registerCubit.confirmVisibilityPassword(),
                                  icon: registerCubit.confirmNotVisible
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                                validator: (value) => value!.isEmpty
                                    ? 'من فضلك اعد ادخال كلمه المرور'
                                    : (value !=
                                            registerCubit
                                                .registerPasswordControl.text)
                                        ? 'كلمه المرور غير متطابق'
                                        : null,
                              ),
                              // Sized Box
                              const SizedBox(height: 30),
                              // button to submit register
                              CustomButton(
                                text: 'إنشاء',
                                onPressed: () {
                                  if (registerCubit.formKey.currentState!
                                      .validate()) {
                                    registerCubit.register();
                                    // navigateWithArgument(
                                    //   context,
                                    //   RouteConstant.verifyRoute,
                                    //   false,
                                    // );
                                  }
                                },
                              ),
                              // Sized Box
                              const SizedBox(height: 10),
                              // Text button class to   navigate to login page if you have account
                              TextButtonClass(
                                onPressed: () => navigatorAndFinish(
                                  context,
                                  RouteConstant.loginRoute,
                                ),
                                text: 'هل لديك حساب بالفعل ؟',
                                textColor: mainColor,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
       // },
      ),
    );
  }
}
