import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/otp_cubit/otp_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/widgets/otp_dialog.dart';
import 'package:lost_app/authentication/presentation/register/widgets/register_form.dart';
import 'package:lost_app/authentication/presentation/register/widgets/submit_button.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/styles/color.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<OtpCubit>(context);
    return Scaffold(
      body: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {
          if (state is PhoneVerifyCodeError) {
            showToast(state: ToastStates.error, message: state.message);
          } else if (state is PhoneVerifyOtpSuccess) {
            navigateTo(context, RouteConstant.otpRoute);
            BlocProvider.of<OtpCubit>(context).register();
          } else if (state is PhonePinCodeNotFilled) {
            showToast(
              state: ToastStates.error,
              message: 'Please fill in all blocks before restoring',
            );
          }

          if (state is RegisterSuccess) {
            BlocProvider.of<LoginCubit>(context).login(
              password: registerCubit.registerPasswordControl.text,
              phone: registerCubit.registerPhoneControl.text,
            );
            showDialog(
              context: context,
              builder: (BuildContext context) => OtpDialog(),
            );
          } else if (state is RegisterError) {
            showToast(message: state.message, state: ToastStates.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: SvgPicture.asset('assets/images/logo.svg'),
                      ),
                    ),
                    const RegisterForm(),
                    const SizedBox(height: 30),
                    const SubmitButton(),
                    const SizedBox(height: 10),
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
            ),
          );
        },
      ),
    );
  }
}
