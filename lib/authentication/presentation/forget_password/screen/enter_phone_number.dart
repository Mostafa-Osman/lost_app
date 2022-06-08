import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/forget_password/reset_password_cubit/reset_password_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/exceptions/phone_validation.dart';
import 'package:lost_app/shared/styles/color.dart';

class PhoneNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final resetPasswordCubit = BlocProvider.of<ResetPasswordCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: mainColor,
            size: 30.0,
          ),
          onPressed: () {
            navigatorAndFinish(context, RouteConstant.loginRoute);
          },
        ),
      ),
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is VerifyPhoneNumberSuccess) {
            if (resetPasswordCubit.isVerifyPhoneNumber.data.isRegistered) {
              navigateWithArgument(
                context,
                RouteConstant.otpRoute,
                [
                  resetPasswordCubit.phoneNumberController.text,
                  '',
                  resetPasswordCubit.isVerifyPhoneNumber.data.username,
                  'forget',
                  ''
                ],
              );
              log('mostafa :${resetPasswordCubit.phoneNumberController.text}');
            } else {
              showToast(
                message: 'هذا الرقم ليس لديه حساب',
                state: ToastStates.error,
              );
            }
          } else if (state is VerifyPhoneNumberError) {
            showToast(message: state.message, state: ToastStates.error);
          }
        },
        builder: (context, state) {
          if (state is VerifyPhoneNumberLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.only(
                top: 30.0,
                right: 30,
                left: 30,
                bottom: 30,
              ),
              child: Column(
                children: [
                  const TextClass(
                    text: 'ادخل رقم هاتفك',
                    fontSize: 30.0,
                  ),
                  const SizedBox(height: 10),
                  TextClass(
                    text: 'ادخل رقم هاتفك لنتمكن من ارسال رمز التاكيد اليك',
                    fontSize: 20.0,
                    textColor: lightGrey,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topRight,
                    child: const TextClass(
                      text: 'رقم الهاتف',
                      textAlign: TextAlign.start,
                      fontSize: 20.0,
                    ),
                  ),
                  Form(
                    key: resetPasswordCubit.phoneNumberFormKey,
                    child: TextFormFieldClass(
                      controller: resetPasswordCubit.phoneNumberController,
                      textHint: 'ادخل رقم هاتفك',
                      keyboardType: TextInputType.phone,
                      validator: (value) => value!.isEmpty
                          ? 'من فضلك ادخل رقم هاتفك'
                          : (value.length != 11)
                              ? 'يجيب ان يكون رقم الهاتف مكون من 11 رقم'
                              : !checkPhoneValidate(
                                  phoneNumber: resetPasswordCubit
                                      .phoneNumberController.text,
                                )
                                  ? 'رقم الهاتف غير صحيح'
                                  : null,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        text: 'التالي',
                        onPressed: () {
                          if (resetPasswordCubit
                              .phoneNumberFormKey.currentState!
                              .validate()) {
                            resetPasswordCubit.verifyPhoneNumber(
                              phoneNumber: resetPasswordCubit
                                  .phoneNumberController.text,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
