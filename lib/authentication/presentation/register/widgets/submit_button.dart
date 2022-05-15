import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/shared/components/custom_button.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    return CustomButton(
      text: 'إنشاء',
      onPressed: () {
        if (registerCubit.formKey.currentState!.validate()) {
          log('yes');
           registerCubit.register();

        }
      },
    );
  }
}
