import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class FormCreatePost extends StatelessWidget {
  const FormCreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);

    return Form(
      key: addPersonDataCubit.nameFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextClass(
            text: 'الاسم',
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
          const SizedBox(height: 5),
          TextFormFieldClass(
            roundedRectangleBorder: 8.0,
            controller: addPersonDataCubit.personNameController,
            textHint: 'ادخل اسم المفقود',
            textColor: lightGrey,
            textInputAction: TextInputAction.next,
            hintStyle: const TextStyle(fontSize: 12),
            validator: (value) =>
                value!.isEmpty ? 'من فضلك ادخل اسم المفقود' : null,
          ),
          const SizedBox(height: 15),
          const TextClass(
            text: 'الفئه العمريه',
            fontSize: 15,
          ),
          const SizedBox(height: 5),
          TextFormFieldClass(
            roundedRectangleBorder: 8.0,
            controller: addPersonDataCubit.personAgeController,
            keyboardType: TextInputType.number,
            textHint: 'ادخل العمر التقريبي',
            hintStyle: const TextStyle(fontSize: 12),
            textColor: lightGrey,
            validator: (value) =>
                value!.isEmpty ? 'من فضلك ادخل العمر التقريبي' : null,
          ),
        ],
      ),
    );
  }
}
