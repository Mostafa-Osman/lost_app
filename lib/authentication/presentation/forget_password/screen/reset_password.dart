import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/forget_password/reset_password_cubit/reset_password_cubit.dart';
import 'package:lost_app/authentication/presentation/forget_password/widgets/reset_password_dialog.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/styles/color.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final resetPasswordCubit = BlocProvider.of<ResetPasswordCubit>(context);
    return Scaffold(
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            BlocProvider.of<ResetPasswordCubit>(context)
                .checkTimerCanceled(status: false);
            showToast(message: state.message, state: ToastStates.success);
            BlocProvider.of<LoginCubit>(context).login(
              phone: resetPasswordCubit.resetPasswordControl.text,
              password: resetPasswordCubit.phoneNumberController.text,
            );
            showDialog(
              context: context,
              builder: (BuildContext context) => const ResetPasswordDialog(),
            );
          } else if (state is ResetPasswordError) {
            showToast(state: ToastStates.error, message: state.message);
          }
        },
        builder: (context, state) {
          if (state is ResetPasswordLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    TextClass(
                      text:
                          'مرحبا,${resetPasswordCubit.isVerifyPhoneNumber.data.username}',
                      fontSize: 25,
                    ),
                    // sized box with height 50
                    const SizedBox(height: 50),
                    Form(
                      key: resetPasswordCubit.resetPasswordFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  text password
                          const TextClass(
                            text: 'كلمه المرور الجديده',
                            fontSize: 20,
                          ),
                          // Text form field to enter password
                          TextFormFieldClass(
                            textHint: 'ادخل كلمه المرور الجديده',
                            controller: resetPasswordCubit.resetPasswordControl,
                            obscureText:
                                resetPasswordCubit.resetPasswordVisibility,
                            textInputAction: TextInputAction.next,
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  resetPasswordCubit.changeResetVisibility(),
                              icon: resetPasswordCubit.resetPasswordVisibility
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'من فضلك ادخل كلمه المرور'
                                : (value.length < 8)
                                    ? 'كلمه المرور اقل من 8 احرف'
                                    : null,
                          ),
                          // Sized Box with height 20
                          const SizedBox(height: 20),
                          //  Text to  confirm password
                          const TextClass(
                            text: 'تأكيد كلمه المرور الجديده',
                            fontSize: 20,
                          ),
                          //  Text form field to confirm password
                          TextFormFieldClass(
                            textHint: ' اعد تأكيد ادخل كلمه المرور الجديده',
                            controller:
                                resetPasswordCubit.resetConfirmPasswordControl,
                            obscureText: resetPasswordCubit
                                .resetConfirmPasswordVisibility,
                            suffixIcon: IconButton(
                              onPressed: () => resetPasswordCubit
                                  .changeResetConfirmVisibility(),
                              icon: resetPasswordCubit
                                      .resetConfirmPasswordVisibility
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'من فضلك اعد ادخال كلمه المرور'
                                : (value !=
                                        resetPasswordCubit
                                            .resetPasswordControl.text)
                                    ? 'كلمه المرور غير متطابق'
                                    : null,
                          ),
                        ],
                      ),
                    ),
                    // Button to submit (show alert dialog)
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          text: 'التالي',
                          onPressed: () {
                            if (resetPasswordCubit
                                .resetPasswordFormKey.currentState!
                                .validate()) {
                              resetPasswordCubit.resetPassword();
                            }
                          },
                        ),
                      ),
                    ),
                    // Sized Box with height 10
                    const SizedBox(height: 10),
                    TextButtonClass(
                      text:
                          'لست,${resetPasswordCubit.isVerifyPhoneNumber.data.username}',
                      textColor: lightGrey,
                      onPressed: () {
                        navigatorAndFinish(
                          context,
                          RouteConstant.phoneNumberRoute,
                        );
                        resetPasswordCubit.clearData();
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
