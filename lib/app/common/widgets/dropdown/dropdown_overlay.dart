import 'package:flutter/material.dart';
import 'package:lost_app/app/common/widgets/bottom_sheet/selectable_item.dart';
import 'package:lost_app/app/common/widgets/dropdown/dropdown_item.dart';

class DropDown<T extends SelectableItem> extends StatelessWidget {
  final double? itemHeight;
  final List<T> items;
  final void Function(T selectedItem) onItemSelected;
  final double maxNumOfVisibleItems;

  const DropDown({
    this.itemHeight,
    required this.items,
    required this.onItemSelected,
    required this.maxNumOfVisibleItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              height: items.length > maxNumOfVisibleItems
                  ? maxNumOfVisibleItems * itemHeight!
                  : items.length * itemHeight!,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: items.length,
                  itemBuilder: (_, index) => DropDownItem(
                    last: index == items.length - 1,
                    title: items[index].title,
                    onPress: () => onItemSelected(items[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
