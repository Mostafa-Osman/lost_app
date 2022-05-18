import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/exceptions/phone_validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return Form(
          key: loginCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextClass(
                text: 'رقم الهاتف',
              ),
              TextFormFieldClass(
                textHint: 'ادخل رقم هاتفك',
                controller: loginCubit.loginPhoneControl,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                validator: (value) =>
                value!.isEmpty
                    ? 'من فضلك ادخل رقم هاتفك'
                    : (value.length != 11)
                    ? 'يجيب ان يكون رقم الهاتف مكون من 11 رقم'
                    : !checkPhoneValidate(
                  phoneNumber: loginCubit.loginPhoneControl.text,
                )
                    ? 'رقم الهاتف غير صحيح'
                    : null,
              ),
              const SizedBox(height: 15),
              const TextClass(
                text: 'كلمه المرور',
              ),
              TextFormFieldClass(
                textHint: 'ادخل كلمه المرور',
                controller: loginCubit.loginPasswordControl,
                suffixIcon: IconButton(
                  onPressed: () => loginCubit.loginVisibilityPassword(),
                  icon: loginCubit.isVisibility
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                obscureText: loginCubit.isVisibility,
                validator: (value) =>
                value!.isEmpty
                    ? 'من فضلك ادخل كلمه المرور'
                    : (value.length < 8)
                    ? 'كلمه المرور اقل من 8 احرف'
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
