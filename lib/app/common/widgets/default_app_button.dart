import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lost_app/app/common/themes/app_theme.dart';
import 'package:lost_app/app/common/widgets/shimmer/shimmer_button.dart';

class DefaultAppButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final double width;
  final double height;
  final VoidCallback? onPress;
  final VoidCallback? onDisabledPressed;
  final BorderRadiusGeometry? borderRadius;
  final bool isDisabled;
  final bool isLoading;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Border? border;
  final double? titleSize;

  const DefaultAppButton({
    this.title = '',
    this.titleColor = Colors.white,
    this.buttonColor = AppTheme.lightPrimaryColor,
    this.width = 220,
    this.height = 42,
    this.onPress,
    this.onDisabledPressed,
    this.textStyle,
    this.borderRadius,
    this.prefixIconPath,
    this.suffixIconPath,
    this.border,
    this.titleSize,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: isLoading
          ? ShimmerButton(width: width, height: height)
          : GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                if (isDisabled) {
                  onDisabledPressed?.call();
                } else {
                  onPress?.call();
                }
              },
              child: Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      isDisabled ? AppTheme.disabledButtonColor : buttonColor,
                  borderRadius: borderRadius ?? BorderRadius.circular(5),
                  border: border,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefixIconPath != null) ...[
                      SvgPicture.asset(prefixIconPath!, height: 24),
                      const SizedBox(width: 10)
                    ],
                    Text(
                      title,
                      style: textStyle ??
                          TextStyle(
                            color: titleColor,
                            // fontWeight: FontWeight.w300,
                            fontSize: titleSize ?? 16,
                          ),
                    ),
                    if (suffixIconPath != null) ...[
                      const SizedBox(width: 10),
                      SvgPicture.asset(suffixIconPath!, height: 24)
                    ],
                  ],
                ),
              ),
            ),
    );
  }
}
