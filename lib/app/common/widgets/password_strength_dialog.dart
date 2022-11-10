import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:lost_app/app/common/themes/app_colors.dart';
import 'package:lost_app/app/common/themes/app_theme.dart';

void showPasswordStrengthDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/icons/shield_done.svg',
                width: 81,
                height: 95,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Password Strength',
                style: TextStyle(
                  color: AppTheme.lightPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Strong password must meet these conditions:',
              style: TextStyle(
                color: AppColors.blackNeutral90,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              ' - 8 digits \n'
              ' - one character \n'
              ' - one special symbol \n'
              ' - Allowed special characters: \n'
              "   ' ! @ # \$ % ^ & * ( ) , . ? : { } | \" < > ' ",
              style: TextStyle(
                color: AppColors.blackNeutral90,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
