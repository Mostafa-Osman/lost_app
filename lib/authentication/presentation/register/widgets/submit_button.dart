import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/toast.dart';

class RegisterSubmitButton extends StatelessWidget {
  const RegisterSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is VerifyPhoneIsFoundSuccess && !registerCubit.phoneIsFound) {
          navigateWithArgument(
            context,
            RouteConstant.otpRoute,
            [ registerCubit.registerPhoneControl.text, 'sign-up'],
          );
        } else if (state is VerifyPhoneIsFoundSuccess &&
            registerCubit.phoneIsFound) {
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
            if (registerCubit.registerFormKey.currentState!.validate()) {
              registerCubit.verifyPhoneNumber(
                phoneNumber: registerCubit.registerPhoneControl.text,
              );
            }
          },
        );
      },
    );
  }
}
