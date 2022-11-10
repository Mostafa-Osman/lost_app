import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/modules/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/shared/bottom_sheet/custom_select_sheet.dart';

class CitiesSheet extends StatelessWidget {
  const CitiesSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);

    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        return  CustomSelectSheet(
          hintTitle: "من فضلك اختر المنطقه",
          searchHint: "من فضلك اختر المنطقه",
          selectedItem: addPersonDataCubit.selectedCity,
          items: addPersonDataCubit.filteredCities,
          onErrorMessage: 'برجاء اختيار المحافظه اولا',
          onSelectItem: (item) {
            //todo handle it
            // addPersonDataCubit.setSelectedCities(item);
          },
        );
      },
    );
  }
}
