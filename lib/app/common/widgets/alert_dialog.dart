import 'package:flutter/material.dart';
import 'package:lost_app/app/common/themes/app_theme.dart';
import 'package:lost_app/app/common/widgets/default_app_button.dart';
import 'package:lottie/lottie.dart';

void passwordChangedAlertDialog(
  BuildContext context, {
  //Widget? icon,
  String? title,
  String? lottiePath,
  String? subtitle,
  String? titleButton,
  VoidCallback? onPress,
  String? titleFallBack,
  VoidCallback? onPressFallBack,
  bool smallFontSubtitle = false,
  bool fallbackHasBackground = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icon!,
              SizedBox(
                height: 100,
                child: Lottie.asset(
                  lottiePath!,
                  repeat: false,
                ),
              ),
              const SizedBox(height: 15),
              if (title != null)
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (title != null && smallFontSubtitle)
                const SizedBox(height: 20),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: smallFontSubtitle
                      ? const TextStyle(
                          color: Color.fromRGBO(30, 30, 30, 0.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )
                      : const TextStyle(
                          color: Color.fromRGBO(30, 30, 30, 0.6),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                  textAlign: TextAlign.center,
                ),
              if (titleButton != null)
                const SizedBox(
                  height: 30,
                ),
              if (titleButton != null)
                DefaultAppButton(
                  title: titleButton,
                  onPress: onPress,
                  width: 218,
                  height: 45,
                  titleSize: 14,
                ),
              if (titleFallBack != null)
                const SizedBox(
                  height: 20,
                ),
              if (titleFallBack != null)
                DefaultAppButton(
                  height: 45,
                  width: 218,
                  title: titleFallBack,
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: fallbackHasBackground
                        ? AppTheme.lightPrimaryColor
                        : const Color(0xFFC2C2C2),
                  ),
                  buttonColor: fallbackHasBackground
                      ? AppTheme.lightPrimaryColor.withOpacity(0.1)
                      : null,
                  onPress: onPressFallBack,
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
