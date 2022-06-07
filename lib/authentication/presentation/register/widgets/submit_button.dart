import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/forget_password/reset_password_cubit/reset_password_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/otp_cubit/otp_cubit.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/toast.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpCubit = BlocProvider.of<OtpCubit>(context);
    return BlocConsumer<OtpCubit, OtpStates>(
      listener: (context, state) {
        if (state is VerifyPhoneIsFoundSuccess && !otpCubit.phoneIsFound) {
          otpCubit.verifyPhoneNumber(
              phoneNumber: otpCubit.registerPhoneControl.text,);
         otpCubit.requestPhone(otpCubit.registerPhoneControl.text,'sign-up');
         // Navigator.pushNamed(context,RouteConstant.otpRoute );
        } else if (state is VerifyPhoneIsFoundSuccess &&
            otpCubit.phoneIsFound) {
          showToast(
            message: 'هذا الرقم مسجل بالفعل',
            state: ToastStates.warning,
          );
        } else if (state is VerifyPhoneIsFoundError) {
          showToast(
            message: 'error',
            state: ToastStates.error,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'إنشاء',
          onPressed: () {
            if (otpCubit.registerFormKey.currentState!.validate()) {
              otpCubit.verifyPhoneNumber(
                phoneNumber: otpCubit.registerPhoneControl.text,
              );
            }
          },
        );
      },
    );
  }
}
