import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/authentication/presentation/otp/verify_cubit/otp_cubit.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
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
    final otpCubit = BlocProvider.of<OtpCubit>(context);
    final registerCubit = BlocProvider.of<RegisterCubit>(context);


    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            const Center(child: CircularProgressIndicator(color: Colors.blue,));
          } else if (state is RegisterSuccess) {
            otpCubit.sendOtp(phoneNumber: registerCubit.registerPhoneControl.text);
            navigateWithArgument(
              context,
              RouteConstant.otpRoute,
              false,
            );
          } else if (state is RegisterError) {
            showToast(state: ToastStates.error, message: state.message);
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
        // },
      ),
    );
  }
}
