import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lost_app/app/common/themes/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    this.onExitPressed,
    this.iconColor=AppColors.darkPrimaryColor,
  });

  final VoidCallback? onExitPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onExitPressed ?? () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          end: 12,
          start: 20,
          bottom: 12,
          top: 22,
        ),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: SvgPicture.asset(
            'assets/icons/icon_back.svg',
            color: iconColor,
            matchTextDirection: true,
          ),
        ),
      ),
    );
  }
}
