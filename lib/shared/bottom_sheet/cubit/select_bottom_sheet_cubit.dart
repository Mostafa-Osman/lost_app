import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/common/widgets/bottom_sheet/selectable_item.dart';

part 'select_bottom_sheet_state.dart';

class SelectBottomSheetCubit extends Cubit<SelectBottomSheetState> {
  SelectBottomSheetCubit() : super(SelectBottomSheetInitial());
  final filterController = TextEditingController();

  late List<SelectableItem> fullItems;
  late List<SelectableItem> filteredItems;

  void init(List<SelectableItem> fullList) {
    fullItems = fullList;
    filteredItems = fullList;
    filterController.text = '';
  }

  void filterItems(String filterText) {
    filteredItems = getFilteredItems(filterText);
    emit(SelectBottomSheetRefreshItems());
  }

  List<SelectableItem> getFilteredItems(String filterText) {
    return fullItems
        .where((e) => e.title.toLowerCase().contains(filterText.toLowerCase()))
        .toList();
  }
}
