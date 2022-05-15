import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/forget_password/reset_password_cubit/reset_password_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/verify_cubit/otp_cubit.dart';
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
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is VerifyPhoneNumberLoading) {
            const Center(
              child: CircularProgressIndicator(color:Colors.blue,strokeWidth: 20.0,),
            );
          } else if (state is VerifyPhoneNumberError) {
            showToast(message: state.message, state: ToastStates.error);
          } else if (state is VerifyPhoneNumberSuccess){
            if (resetPasswordCubit.isVerifyPhoneNumber) {
              navigateWithArgument(
                context,
                RouteConstant.otpRoute,
                true,
              );
              // BlocProvider.of<OtpCubit>(context).sendOtp(
              //   phoneNumber: resetPasswordCubit.phoneNumberController.text,
              // );
            } else {
              showToast(
                message: 'هذا الرقم ليس لديه حساب',
                state: ToastStates.error,
              );
            }
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
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
                          if (resetPasswordCubit.phoneNumberFormKey.currentState!
                              .validate()) {
                            resetPasswordCubit.verifyPhoneNumber();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
