import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/data/local/pref/governorate_data.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/shared/bottom_sheet/custom_select_sheet.dart';

class GovernoratesSheet extends StatelessWidget {
  final String titleOfCity;
  const GovernoratesSheet({Key? key,required this.titleOfCity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);

    return BlocBuilder<CreatePostCubit, CreatePostStates>(
      builder: (context, state) {
        return CustomSelectSheet(
          title: titleOfCity,
          hintTitle: "من فضلك اختر المحافظه",
          searchHint: "من فضلك اختر المحافظه",
          selectedItem: addPersonDataCubit.selectedGovernorate,
          items: getGovernorates(),
          haveBottomPadding: false,
          onSelectItem: (item) {
            addPersonDataCubit.setSelectedGovernorate(item);
            addPersonDataCubit.getFilteredCities(item.id);
          },
        );
      },
    );
  }
}
