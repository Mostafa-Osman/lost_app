import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/shared/bottom_sheet/cubit/select_bottom_sheet_cubit.dart';
import 'package:lost_app/shared/bottom_sheet/show_select_sheet.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/model/select_item.dart';
import 'package:lost_app/shared/units/number_units.dart';

class CustomSelectSheet extends StatelessWidget {
  final String title;
  final String hintTitle;
  final bool haveBottomPadding;
  final SelectableItem? selectedItem;
  final String searchHint;
  final bool isDataLoading;
  final List<SelectableItem> items;
  final Function(SelectableItem v) onSelectItem;
  final String onErrorMessage;
  final VoidCallback? onLoadingStatePressed;
  final bool isDisabled;

  const CustomSelectSheet({
    Key? key,
    this.title = '',
    this.haveBottomPadding = true,
    required this.hintTitle,
    required this.selectedItem,
    required this.items,
    this.isDataLoading = false,
    required this.onSelectItem,
    this.onErrorMessage = 'برجاء الانتظار',
    required this.searchHint,
    this.onLoadingStatePressed,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items.length == 1 && selectedItem == null) {
      onSelectItem(items.first);
    }
    if (isSelectedValueEqualZero()) {
      return const SizedBox();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              fontFamily: 'Tajawal',
            ),
          ),
          const SizedBox(height: 5),

          BlocProvider(
            create: (context) => SelectBottomSheetCubit(),
            child: GestureDetector(
              onTap: () {
                if (isDataLoading) {
                  if (onLoadingStatePressed != null) {
                    onLoadingStatePressed!.call();
                  } else {
                    showToast(
                      message: 'الرجاء الانتظار',
                      state: ToastStates.warning,
                    );
                  }
                } else {
                  if (items.isNotEmpty) {
                    if (items.length == 1) {
                      showToast(
                        message: 'خيار واحد متاح',
                        state: ToastStates.warning,
                      );
                    } else {
                      showSelectBottomSheet(
                        context,
                        title: hintTitle,
                        list: items,
                        onSelectItem: (v) => onSelectItem(v),
                        searchHint: searchHint,
                        selectedItem: selectedItem,
                      );
                    }
                  } else {
                    showToast(
                      message: onErrorMessage,
                      state: ToastStates.error,
                    );
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xff808080)),
                  color: items.length == 1 || isDisabled
                      ? Colors.grey[300]
                      : Colors.white,
                  boxShadow: items.length != 1 && !isDisabled
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                          )
                        ]
                      : null,
                ),
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedItem == null ? hintTitle : selectedItem!.title,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Tajawal',
                        color: selectedItem == null ? Colors.grey[700] : null,
                        fontSize: 12,
                      ),
                    ),
                    if (isDataLoading)
                      const CupertinoActivityIndicator(
                        radius: 8,
                      ),
                    if (items.length != 1 && !isDataLoading)
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.grey[400],
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (haveBottomPadding)
            const SizedBox(
              height: 15,
            )
        ],
      );
    }
  }

  bool isSelectedValueEqualZero() {
    return selectedItem != null &&
        isNumeric(selectedItem!.title) &&
        double.parse(selectedItem!.title) == 0;
  }
}
