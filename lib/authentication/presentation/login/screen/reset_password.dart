import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/components/timer.dart';
import 'package:lost_app/shared/styles/color.dart';


class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController resetPasswordControl = TextEditingController();
  final TextEditingController resetConfirmPasswordControl =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final loginCubit = BlocProvider.of<LoginCubit>(context);

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  // text
                  const TextClass(text: 'مرحبا, مصطفي عثمان', fontSize: 25),
                  // sized box with height 50
                  const SizedBox(height: 50),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  text password
                        const  TextClass(text: 'كلمه المرور', fontSize: 20),
                        // Text form field to enter password
                        TextFormFieldClass(
                          textHint: 'ادخل كلمه المرور',
                          controller: resetPasswordControl,
                          obscureText: loginCubit.resetPasswordVisibility,
                          suffixIcon: IconButton(
                              onPressed: () => loginCubit.changeResetVisibility(),
                              icon: loginCubit.resetPasswordVisibility
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),),
                          validator: (value) => value!.isEmpty
                              ? 'من فضلك ادخل كلمه المرور'
                              : (value.length < 8)
                                  ? 'كلمه المرور اقل من 8 احرف'
                                  : null,
                        ),
                        // Sized Box with height 20
                        const SizedBox(height: 20),
                        //  Text to  confirm password
                        const   TextClass(text: 'تأكيد كلمه المرور ', fontSize: 20),
                        //  Text form field to confirm password
                        TextFormFieldClass(
                          textHint: ' اعد تأكيد ادخل كلمه المرور',
                          controller: resetConfirmPasswordControl,
                          obscureText: loginCubit.resetConfirmPasswordVisibility,
                          suffixIcon: IconButton(
                              onPressed: () =>
                                  loginCubit.changeResetConfirmVisibility(),
                              icon: loginCubit.resetConfirmPasswordVisibility
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),),
                          validator: (value) => value!.isEmpty
                              ? 'من فضلك اعد ادخال كلمه المرور'
                              : (value != resetPasswordControl.text)
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
                      child:  CustomButton(
                            text: 'التالي',

                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Dialog(),);
                              }
                            },),
                      ),

                  ),
                  // Sized Box with height 10
                  const SizedBox(height: 10),
                  // Text Button (back to change mobile number)
                  TextButtonClass(
                    text: 'لست مصطفي عثمان؟',
                    textColor: lightGrey,
                    onPressed: () => navigatorAndFinish(
                        context, RouteConstant.phoneNumberRoute,),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialogClass(
      height: 260.0,
      // Title of dialog
      widget: Column(
        children:const [
          TextClass(
            text: 'تهانينا لقد قمت بإعاده تعيين',
          ),
          TextClass(
            text: 'كلمه المرور بنجاح',
          ),
        ],
      ),
      // Button with timer to go to home page

      bottomWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtonClass(
            onPressed: () => navigatorAndFinish(context, RouteConstant.homeLayoutRoute),
            text: 'الي الصفحه الرئيسيه',
            fontSize: 20,
            textColor: mainColor,
          ),
          // Timer with 5 second to go home screen automatic
          TimerClass(
            5,
            const Duration(milliseconds: 1000),
            () => navigatorAndFinish(context, RouteConstant.homeLayoutRoute),
          ),
        ],
      ),
    );
  }
}
