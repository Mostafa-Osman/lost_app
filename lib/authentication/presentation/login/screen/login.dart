import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/authentication/presentation/forget_password/reset_password_cubit/reset_password_cubit.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/authentication/presentation/login/widgets/login_form.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/styles/color.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      backgroundColor: white,
      body: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginLoading)
            {
            const  Center(
                child: CircularProgressIndicator(color: Colors.red,),
              );
            }

          else if (state is LoginSuccess) {
            navigatorAndFinish(context, RouteConstant.homeLayoutRoute);
          } else if (state is LoginError) {
            showToast(state: ToastStates.error, message: state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              color: white,
              child:Column(
                children: [
                  const SizedBox(height: 80),
                  SizedBox(
                    height: 300.0,
                    width:double.infinity,
                    child: SvgPicture.asset(
                      'assets/images/login.svg',
                      fit: BoxFit.cover,

                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.53,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const   LoginForm(),
                        TextButtonClass(
                          onPressed: () {
                            BlocProvider.of<ResetPasswordCubit>(context)
                                .phoneNumberController
                                .clear();
                            navigateTo(
                              context,
                              RouteConstant.phoneNumberRoute,
                            );
                          },
                          text: 'هل نسيت كلمه المرور ؟ ',
                          textColor: lightGrey,
                        ),
                        // Sized Box with height 10
                        const SizedBox(height: 10),
                        // Button to submit (go to home screen)
                        CustomButton(
                          onPressed: () {
                            if (loginCubit.formKey.currentState!
                                .validate()) {
                              BlocProvider.of<LoginCubit>(context)
                                  .login(
                                phone:
                                loginCubit.loginPhoneControl.text,
                                password: loginCubit
                                    .loginPasswordControl.text,
                              );
                            }
                          },
                          text: 'تسجيل الدخول',
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextClass(
                                  text: 'ليس لديك حساب ؟',
                                  textColor: lightGrey,
                                ),
                              ),
                              Expanded(
                                child: TextButtonClass(
                                  onPressed: () {
                                    navigatorAndFinish(
                                      context,
                                      RouteConstant.registerRoute,
                                    );
                                  },
                                  text: 'إنشاء حساب',
                                  fontSize: 18,
                                  textColor: mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
