import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lost_app/app/common/widgets/bottom_sheet/selectable_item.dart';
import 'package:lost_app/app/common/widgets/input_field/default_text_field.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

Future showSelectBottomSheet<T extends SelectableItem>(
  BuildContext context, {
  required String title,
  required List<T> fullList,
  required T? selectedItem,
  required Function(T v) onSelectItem,
}) {
  late void Function(void Function()) onChange;
  final fullItems = fullList;
  List<T> filteredItems = fullList;

  return showSlidingBottomSheet(
    context,
    builder: (context) {
      return SlidingSheetDialog(
        cornerRadius: 24,
        snapSpec: const SnapSpec(
          initialSnap: 0.5,
          snappings: [0.65, 0.85],
        ),
        headerBuilder: (context, state) {
          return Material(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
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
                if (fullList.length > 9)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: DefaultTextField(
                      hintText: 'search',
                      prefixIconPath: 'assets/icons/search.svg',
                      onChange: (s) => onChange(() {
                        filteredItems = getFilteredItems(s, fullItems);
                      }),
                    ),
                  ),
              ],
            ),
          );
        },
        builder: (context, state) {
          return StatefulBuilder(
            builder: (context, setState) {
              onChange = setState;
              return Material(
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (T item in filteredItems)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                if (item != selectedItem) onSelectItem(item);
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
                                        'assets/icons/check_square.svg',
                                        // width: 15,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            if (item != filteredItems.last)
                              const Divider(height: 3, thickness: 1.2),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        footerBuilder: (_, __) => SizedBox(height: Platform.isIOS ? 15 : 0),
      );
    },
  );
}

List<T> getFilteredItems<T extends SelectableItem>(
  String filterText,
  List<T> fullItems,
) {
  return fullItems
      .where((e) => e.title.toLowerCase().contains(filterText.toLowerCase()))
      .toList();
}
