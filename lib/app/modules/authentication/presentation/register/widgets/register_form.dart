
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/modules/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/app/common/exceptions/phone_validation.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: registerCubit.registerFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextClass(text: 'الاسم',fontSize: 16.0,),
              const SizedBox(height: 4.0),
              TextFormFieldClass(
                textHint: 'ادخل اسمك',
                fontSize: 15.0,
                textInputAction: TextInputAction.next,
                controller: registerCubit.registerNameControl,
                validator: (value) =>
                    value!.isEmpty ? 'من فضلك ادخل اسمك' : null,
              ),
              const SizedBox(height: 15),
              const TextClass(text: 'رقم الهاتف',fontSize: 16.0,),
              const SizedBox(height: 4.0),

              TextFormFieldClass(
                textHint: 'ادخل رقم هاتفك',
                fontSize: 15.0,
                textInputAction: TextInputAction.next,
                controller: registerCubit.registerPhoneControl,
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty
                    ? 'من فضلك ادخل رقم هاتفك'
                    : (value.length != 11)
                        ? 'يجيب ان يكون رقم الهاتف مكون من 11 رقم'
                        : !checkPhoneValidate(
                            phoneNumber: value,
                          )
                            ? 'رقم الهاتف غير صحيح'
                            : null,
              ),
              const SizedBox(height: 15),
              const TextClass(
                text: 'البريد الالكتروني (اختياري)',fontSize: 16.0,

              ),
              const SizedBox(height: 4.0),

              TextFormFieldClass(
                textHint: 'ادخل بريدك الالكتروني',
                fontSize: 15.0,

                textInputAction: TextInputAction.next,
                controller: registerCubit.registerEmailControl,
                validator: (value) => (value!.isNotEmpty &&
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value))
                    ? 'البريد الالكتروني الذي ادخلته غير صحيح'
                    : null,
              ),
              const SizedBox(height: 15),
              const TextClass(text: 'كلمه المرور',fontSize: 16.0,),
              const SizedBox(height: 4.0),

              TextFormFieldClass(
                textHint: 'ادخل كلمه المرور',
                fontSize: 15.0,
                controller: registerCubit.registerPasswordControl,
                obscureText: registerCubit.isVisibility,
                suffixIcon: IconButton(
                  onPressed: () => registerCubit..visibilityPassword(),
                  icon: registerCubit.isVisibility
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                validator: (value) => value!.isEmpty
                    ? 'من فضلك ادخل كلمه المرور'
                    : (value.length < 8)
                        ? 'كلمه المرور اقل من 8 احرف'
                        : null,
              ),
              const SizedBox(height: 15),
              const TextClass(text: 'تأكيد كلمه المرور ',fontSize: 16.0,),
              const SizedBox(height: 4.0),

              TextFormFieldClass(
                textHint: ' اعد تأكيد ادخل كلمه المرور',
                fontSize: 15.0,
                controller: registerCubit.registerConfirmPasswordControl,
                obscureText: registerCubit.confirmNotVisible,
                suffixIcon: IconButton(
                  onPressed: () => registerCubit.confirmVisibilityPassword(),
                  icon: registerCubit.confirmNotVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                validator: (value) => value!.isEmpty
                    ? 'من فضلك اعد ادخال كلمه المرور'
                    : (value != registerCubit.registerPasswordControl.text)
                        ? 'كلمه المرور غير متطابق'
                        : null,
              ),


            ],
          ),
        );
      },
    );
  }
}
