
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lost_app/app/common/enums/snakebar_type.dart';
import 'package:lost_app/app/common/extensions/show_wait_toast.dart';
import 'package:lost_app/app/common/extensions/snakebar.dart';
import 'package:lost_app/app/common/themes/app_colors.dart';
import 'package:lost_app/app/common/widgets/bottom_sheet/selectable_item.dart';
import 'package:lost_app/shared/units/number_units.dart';

class CustomSelectSheet<T extends SelectableItem> extends StatelessWidget {
  final String title;
  final String hintTitle;
  final String prefixTitle;
  final double prefixIconHeight;
  final double prefixIconWidth;
  final T? selectedItem;
  final bool isDataLoading;
  final List<T> items;
  final Function(T v) onSelectItem;
  final String? errorMessage;
  final VoidCallback? onLoadingStatePressed;
  final bool isDisabled;
  final bool hasBottomPadding;
  final String? prefixIconPath;
  final VoidCallback? onRetry;

  const CustomSelectSheet({
    this.title = '',
    this.prefixTitle = '',
    required this.hintTitle,
    required this.selectedItem,
    required this.items,
    this.isDataLoading = false,
    required this.onSelectItem,
    this.errorMessage,
    this.prefixIconHeight = 20.0,
    this.prefixIconWidth = 20.0,
    this.onLoadingStatePressed,
    this.isDisabled = false,
    this.hasBottomPadding = true,
    this.prefixIconPath,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    String newTitle = '';
    if (selectedItem != null) {
      if (prefixTitle.isNotEmpty) {
        newTitle = '$prefixTitle ${selectedItem!.title}';
      } else {
        newTitle = selectedItem!.title;
      }
    }
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
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              if (isDataLoading) {
                if (onLoadingStatePressed != null) {
                  onLoadingStatePressed!.call();
                } else {
                  context.showWaitToast();
                }
              } else {
                if (items.isNotEmpty) {
                  if (items.length == 1) {
                    context.showSnakebar(
                      'there_is_only_one_option_available',
                    );
                  } else {
                    //todo handle it
                    // showSelectBottomSheet<T>(
                    //   context,
                    //   title: hintTitle,
                    //   fullList: items,
                    //   onSelectItem: onSelectItem,
                    //   selectedItem: selectedItem,
                    // );
                  }
                } else if (onRetry != null) {
                  onRetry!.call();
                } else {
                  context.showSnakebar(
                    errorMessage ?? 'please_wait',
                    type: SnackBarType.error,
                  );
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10),
                color: AppColors.fillColor,
              ),
              height: 54,
              child: Row(
                children: [
                  if (prefixIconPath != null)
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        prefixIconPath!,
                        color: selectedItem == null
                            ? Colors.grey.shade400
                            : AppColors.lightPrimaryColor,
                        height: prefixIconHeight,
                        width: prefixIconWidth,
                      ),
                    ),
                  Text(
                    selectedItem == null ? hintTitle : newTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: selectedItem == null
                          ? Colors.grey.shade400
                          : AppColors.darkPrimaryColor,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  if (isDataLoading) ...[
                    const CupertinoActivityIndicator(radius: 8),
                    const SizedBox(width: 14)
                  ] else if (items.length != 1)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        bottom: 14,
                        end: 14,
                        top: 14,
                      ),
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: SvgPicture.asset(
                          'assets/icons/arrow_up.svg',
                          color: const Color(0xffADADAD),
                          height: 20,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (hasBottomPadding)
            const SizedBox(
              height: 15,
            )
        ],
      );
    }
  }

  bool isSelectedValueEqualZero() =>
      selectedItem != null &&
      isNumeric(selectedItem!.title) &&
      double.parse(selectedItem!.title) == 0;
}
