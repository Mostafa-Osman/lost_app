import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lost_app/shared/bottom_sheet/cubit/select_bottom_sheet_cubit.dart';
import 'package:lost_app/shared/bottom_sheet/custom_text_field.dart';
import 'package:lost_app/shared/model/select_item.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

Future showSelectBottomSheet(BuildContext context, {
  required String title,
  required String searchHint,
  required List<SelectableItem> list,
  required SelectableItem? selectedItem,
  required Function(SelectableItem v) onSelectItem,
}) {
  final bottomSheetCubit = BlocProvider.of<SelectBottomSheetCubit>(context);
  bottomSheetCubit.init(list);
  return showSlidingBottomSheet(
    context,
    builder: (context) {
      return SlidingSheetDialog(
        cornerRadius: 24,
        snapSpec: const SnapSpec(
          initialSnap: 0.5,
          snappings: [0.65, 0.85],
        ),
        headerBuilder: (context, SheetState state) {
          return Material(
            color: Colors.white,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (list.length > 9)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: CustomTextField(
                        fillColor: const Color(0xffF9F9F9).withOpacity(0.94),
                        height: 45,
                        title: searchHint,
                        hasShadow: false,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: const Color(0xffc4c4c4).withOpacity(0.4),
                          ),
                        ),
                        controller: bottomSheetCubit.filterController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/icons/search.svg',
                            color: const Color(0xffADADAD),
                            height: 24,
                          ),
                        ),
                        onChanged: (text) => bottomSheetCubit.filterItems(text),
                      ),
                    )
                ],
              ),
            ),
          );
        },
        builder: (context, state) {
          return BlocBuilder<SelectBottomSheetCubit, SelectBottomSheetState>(
            builder: (context, state) {
              return Material(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (SelectableItem item
                      in bottomSheetCubit.filteredItems)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                if (item != selectedItem) {
                                  onSelectItem(item);
                                }
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      item.title,
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Spacer(),
                                    if (item == selectedItem)
                                      SvgPicture.asset(
                                        'assets/images/icons/check.svg',
                                        color: Colors.black,
                                        width: 15,
                                      ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ),
                            if (item != bottomSheetCubit.filteredItems.last)
                              const Divider(
                                height: 3,
                                thickness: 1.2,
                              ),
                          ],
                        )
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
