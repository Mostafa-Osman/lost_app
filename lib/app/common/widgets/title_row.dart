import 'package:flutter/material.dart';

import 'package:lost_app/app/common/themes/app_theme.dart';

class TitleRow extends StatelessWidget {
  final String? title;
  final String? actionTitle;
  final VoidCallback? onPress;

  const TitleRow({
    this.title,
    this.actionTitle,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            actionTitle!,
            style: const TextStyle(
              color: AppTheme.lightPrimaryColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
