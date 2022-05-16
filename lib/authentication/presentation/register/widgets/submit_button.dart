
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    final otpCubit = BlocProvider.of<OtpCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RegisterError) {
          showToast(message: state.message, state: ToastStates.error);
        } else if (state is RegisterSuccess) {
          // otpCubit.sendOtp(
          //   phoneNumber: registerCubit.registerPhoneControl.text,
          // );
          registerCubit.setLoginData();
          navigateWithArgument(
            context,
            RouteConstant.otpRoute,
            false,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'إنشاء',
          onPressed: () {
            if (registerCubit.formKey.currentState!.validate()) {
              registerCubit.register();
            }
          },
        );
      },
    );
  }
}
