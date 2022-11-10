
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lost_app/app/common/enums/password_strength.dart';
import 'package:lost_app/app/common/themes/app_colors.dart';
import 'package:lost_app/app/common/themes/app_theme.dart';
import 'package:lost_app/app/common/utils/get_password_strength.dart';
import 'package:lost_app/app/common/widgets/password_strength_dialog.dart';

class PasswordStrengthWidget extends StatelessWidget {
  final String? password;

  const PasswordStrengthWidget(
    this.password,);

  @override
  Widget build(BuildContext context) {
    final passwordStrength = checkPasswordStrength(password ?? '');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Your Password : ',
                style: TextStyle(color: AppTheme.disabledTextColor),
              ),
              if (passwordStrength == PasswordStrength.weak)
                const Text(
                  'Weak',
                  style: TextStyle(color: Colors.deepOrange),
                )
              else if (passwordStrength == PasswordStrength.intermediate)
                const Text(
                  'Intermediate',
                  style: TextStyle(color: Colors.orange),
                )
              else if (passwordStrength == PasswordStrength.strong)
                const Text(
                  'Strong',
                  style: TextStyle(color: Colors.green),
                )
              else
                const Text(
                  'Very Strong',
                  style: TextStyle(color: Colors.green),
                ),
              const SizedBox(width: 5),
              if (passwordStrength == PasswordStrength.weak)
                SvgPicture.asset(
                  'assets/icons/alert.svg',
                  width: 14,
                  color: Colors.deepOrange,
                )
              else if (passwordStrength == PasswordStrength.intermediate)
                SvgPicture.asset(
                  'assets/icons/done.svg',
                  width: 14,
                  color: Colors.orange,
                )
              else
                SvgPicture.asset('assets/icons/done.svg', width: 14)
            ],
          ),
          GestureDetector(
            onTap: () => showPasswordStrengthDialog(context),
            child: SvgPicture.asset(
              'assets/icons/more_info.svg',
              color: AppColors.blackNeutral50,
              height: 18,
              width: 18,
            ),
          )
        ],
      ),
    );
  }
}
