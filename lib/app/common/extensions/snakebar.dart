
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lost_app/app/common/enums/popup_duration.dart';
import 'package:lost_app/app/common/enums/snakebar_type.dart';

extension Snakebar on BuildContext {
  void showSnakebar(
    String message, {
    bool marginBottom = false,
    PopupDuration duration = PopupDuration.medium,
    SnackBarType type = SnackBarType.toast,
  }) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: Duration(
          seconds: (duration == PopupDuration.veryShort)
              ? 1
              : (duration == PopupDuration.short)
                  ? 2
                  : (duration == PopupDuration.medium)
                      ? 3
                      : 4,
        ),
        backgroundColor: type == SnackBarType.toast
            ? Colors.blue
            : type == SnackBarType.error
                ? Colors.red
                : Colors.green,
        padding: const EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: marginBottom == false ? 20 : 80,
          right: 20,
          left: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        content: Row(
          children: [
            if (type != SnackBarType.toast)
              SvgPicture.asset(
                type == SnackBarType.error
                    ? 'assets/icons/false.svg'
                    : 'assets/icons/true.svg',
                height: 20,
              ),
            const SizedBox(width: 5),
            SizedBox(
              width: type != SnackBarType.toast
                  ? MediaQuery.of(this).size.width * 0.72
                  : MediaQuery.of(this).size.width * 0.77,
              child: Text(
                message,
                textAlign: type == SnackBarType.toast
                    ? TextAlign.center
                    : TextAlign.start,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showErrorSnakebar(
    String message, {
    bool marginBottom = false,
    PopupDuration duration = PopupDuration.medium,
  }) {
    showSnakebar(
      message,
      duration: duration,
      type: SnackBarType.error,
      marginBottom: marginBottom,
    );
  }

  void showSuccessSnakebar(
    String message, {
    bool marginBottom = false,
    PopupDuration duration = PopupDuration.medium,
  }) {
    showSnakebar(
      message,
      duration: duration,
      type: SnackBarType.success,
      marginBottom: marginBottom,
    );
  }
}
