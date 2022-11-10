import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/common/data/local/pref/gender_data.dart';
import 'package:lost_app/app/modules/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/shared/bottom_sheet/custom_select_sheet.dart';

class GenderSheet extends StatelessWidget {
  const GenderSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);

    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        return CustomSelectSheet(
          title: 'اختر النوع',
          hintTitle: 'من فضلك اختر النوع',
          searchHint: 'اختر النوع',
          selectedItem: addPersonDataCubit.selectedGender,
          items: genders,
          onErrorMessage: 'error in gender',
          onSelectItem: (item) {
            //todo handle it
            // addPersonDataCubit.setSelectedGender(item);
          },
        );
      },
    );
  }
}
