import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/app/modules/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/app/modules/authentication/presentation/register/widgets/register_form.dart';
import 'package:lost_app/app/modules/authentication/presentation/register/widgets/submit_button.dart';
import 'package:lost_app/app/router/route_names.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/styles/color.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
         if (state is VerifyPhoneIsFoundSuccess) {
            navigateWithArgument(
              context,
              RouteConstant.otpRoute,
             [
               registerCubit.registerPhoneControl.text,
               registerCubit.registerPasswordControl.text,
               registerCubit.registerNameControl.text,
                'sign-up',
               registerCubit.registerEmailControl.text,
              ],
            );
          }
         else   if (state is VerifyPhoneIsFoundError) {
           showToast(state: ToastStates.error, message: state.message);
         }
        },
        builder: (context, state) {
          if(state is VerifyPhoneIsFoundLoading)
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else {
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
                    const RegisterSubmitButton(),
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
          }
        },
      ),
    );
  }
}
