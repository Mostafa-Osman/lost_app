import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lost_app/app/common/themes/app_colors.dart';

class DefaultDisabledTextField extends StatelessWidget {
  final String title;
  final String? text;
  final double? height;
  final TextAlign? textAlign;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final String? disablingReason;
  final double iconHeight;
  final double iconWidth;

  const DefaultDisabledTextField({
    required this.title,
    this.text,
    this.height,
    this.textAlign,
    this.prefixIconPath,
    this.suffixIconPath,
    this.disablingReason,
    this.iconHeight = 20,
    this.iconWidth = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: height ?? 48,
          decoration: BoxDecoration(
            color: const Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            children: [
              if (prefixIconPath != null)
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    prefixIconPath!,
                    color: AppColors.text300,
                  ),
                ),
              Expanded(
                child: Text(
                  text ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    // letterSpacing: 1.1,
                    fontWeight: FontWeight.w400,
                    // color: AppTheme.disabledTextColor,
                  ),
                ),
              ),
              if (suffixIconPath != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    suffixIconPath!,
                    width: iconWidth,
                    height: iconHeight,
                    color: Colors.grey.shade500,
                    fit: BoxFit.fill,
                  ),
                )
            ],
          ),
        ),
        if (disablingReason != null) ...[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              disablingReason!,
              style: const TextStyle(
                color: AppColors.veryDarkGray,
                fontSize: 12,
              ),
            ),
          ),
        ]
      ],
    );
  }
}
