
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lost_app/app/common/extensions/snakebar.dart';
import 'package:lost_app/app/common/themes/app_theme.dart';
import 'package:lost_app/app/common/widgets/bottom_sheet/selectable_item.dart';
import 'package:lost_app/app/common/widgets/dropdown/dropdown_overlay.dart';
class CustomDropDown<T extends SelectableItem> extends StatefulWidget {
  final String? headerTitle;
  final String? validationMessage;
  final bool isValid;
  final String? errorMessage;
  final T? currentItem;
  final String iconPath;
  final List<T> items;
  final void Function(T selectedItem) onItemSelected;
  final bool? valid;
  final Color? dropdownColor;
  final double maxNumOfVisibleItems;
  final String hint;

  const CustomDropDown({
    this.headerTitle,
    required this.currentItem,
    required this.iconPath,
    required this.items,
    required this.onItemSelected,
    this.isValid = true,
    this.valid = true,
    this.errorMessage,
    this.validationMessage,
    this.dropdownColor,
    required this.maxNumOfVisibleItems,
    required this.hint,
  });

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState();
}

class _CustomDropDownState<T extends SelectableItem>
    extends State<CustomDropDown<T>> {
  GlobalKey? actionKey = LabeledGlobalKey('d');
  late double height;
  late double width;
  late double xPos;
  late double yPos;

  late bool isDropdownOpened = false;
  late OverlayEntry dropdown;

  void findDropdownData() {
    final RenderBox? renderBox =
        actionKey!.currentContext!.findRenderObject() as RenderBox?;
    height = renderBox!.size.height;
    width = renderBox.size.width;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    xPos = offset.dx;
    yPos = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => setState(() {
                dropdown.remove();
                isDropdownOpened = false;
              }),
              behavior: HitTestBehavior.translucent,
              child: const ColoredBox(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            left: xPos,
            // height: height * widget.numOfVisibleItems,
            width: width,
            top: yPos + height + 2,
            // ignore: use_decorated_box
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: DropDown<T>(
                  itemHeight: height,
                  maxNumOfVisibleItems: widget.maxNumOfVisibleItems,
                  items: widget.items,
                  onItemSelected: (item) {
                    widget.onItemSelected(item);
                    setState(() {
                      dropdown.remove();
                      isDropdownOpened = false;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDropdownOpened) {
          setState(() {
            isDropdownOpened = false;
            dropdown.remove();
          });
          return false;
        }
        return true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.headerTitle != null && widget.headerTitle!.isNotEmpty) ...[
            Text(
              widget.headerTitle!,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5)
          ],
          GestureDetector(
            key: actionKey,
            onTap: () {
              if (widget.isValid) {
                setState(() {
                  if (isDropdownOpened) {
                    dropdown.remove();
                  } else {
                    findDropdownData();
                    dropdown = _createFloatingDropdown();
                    Overlay.of(context)!.insert(dropdown);
                  }
                  isDropdownOpened = !isDropdownOpened;
                });
              } else {
                context.showErrorSnakebar(widget.errorMessage!);
              }
            },
            child: Container(
              height: 50,
              // width: 343,
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 7, right: 12),
              decoration: BoxDecoration(
                color: widget.dropdownColor ?? const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: widget.valid == false
                      ? Colors.red
                      : const Color(0xFFDFDFE3),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    widget.iconPath,
                    width: 22,
                    height: 22,
                    fit: BoxFit.cover,
                    color: widget.valid!
                        ? widget.currentItem == null
                            ? Colors.black
                            : Colors.blue
                        : Colors.red,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.currentItem?.title ?? widget.hint,
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.valid!
                          ? widget.currentItem == null
                              ? Colors.black
                              : Colors.grey
                          : Colors.red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    isDropdownOpened
                        ? 'assets/icons/arrow_up2.svg'
                        : 'assets/icons/arrow_down.svg',
                    width: 16,
                    height: 9,
                    color: widget.valid == false
                        ? Colors.red
                        : Colors.grey.shade400,
                  ),
                  const SizedBox(width: 5.0),
                ],
              ),
            ),
          ),
          if (widget.validationMessage != null && !widget.valid!)
            Column(
              children: [
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.validationMessage ?? '',
                    style: const TextStyle(
                      color: AppTheme.redColor,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
