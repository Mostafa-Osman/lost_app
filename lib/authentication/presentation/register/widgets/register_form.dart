import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/exceptions/phone_validation.dart';
import 'package:lost_app/shared/styles/color.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        return Form(
          key: registerCubit.formKey,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextClass(text: 'الاسم'),
                TextFormFieldClass(
                  textHint: 'ادخل اسمك',
                  textInputAction: TextInputAction.next,
                  controller: registerCubit.registerNameControl,
                  validator: (value) =>
                      value!.isEmpty ? 'من فضلك ادخل اسمك' : null,
                ),
                const SizedBox(height: 20),
                const TextClass(text: 'رقم الهاتف'),
                TextFormFieldClass(
                  textHint: 'ادخل رقم هاتفك',
                  textInputAction: TextInputAction.next,
                  controller: registerCubit.registerPhoneControl,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.isEmpty
                      ? 'من فضلك ادخل رقم هاتفك'
                      : (value.length != 11)
                          ? 'يجيب ان يكون رقم الهاتف مكون من 11 رقم'
                          : !checkPhoneValidate(
                              phoneNumber: value,
                            )
                              ? 'رقم الهاتف غير صحيح'
                              : null,
                ),
                const SizedBox(height: 20),
                const TextClass(
                  text: 'البريد الالكتروني (اختياري)',
                ),
                TextFormFieldClass(
                  textHint: 'ادخل بريدك الالكتروني',
                  textInputAction: TextInputAction.next,
                  controller: registerCubit.registerEmailControl,
                  validator: (value) => (value!.isNotEmpty &&
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value))
                      ? 'البريد الالكتروني الذي ادخلته غير صحيح'
                      : null,
                ),
                const SizedBox(height: 20),
                const TextClass(text: 'كلمه المرور'),
                TextFormFieldClass(
                  textHint: 'ادخل كلمه المرور',
                  textInputAction: TextInputAction.next,
                  controller: registerCubit.registerPasswordControl,
                  obscureText: registerCubit.isVisibility,
                  suffixIcon: IconButton(
                    onPressed: () => registerCubit..visibilityPassword(),
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
                const SizedBox(height: 20),
                const TextClass(text: 'تأكيد كلمه المرور '),
                TextFormFieldClass(
                  textHint: ' اعد تأكيد ادخل كلمه المرور',
                  controller: registerCubit.registerConfirmPasswordControl,
                  obscureText: registerCubit.confirmNotVisible,
                  suffixIcon: IconButton(
                    onPressed: () => registerCubit.confirmVisibilityPassword(),
                    icon: registerCubit.confirmNotVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  validator: (value) => value!.isEmpty
                      ? 'من فضلك اعد ادخال كلمه المرور'
                      : (value != registerCubit.registerPasswordControl.text)
                          ? 'كلمه المرور غير متطابق'
                          : null,
                ),


              ],
            ),
          ),
        );
      },
    );
  }
}
