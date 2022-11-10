
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension WaitToast on BuildContext {
  void showWaitToast({String? message, bool hasBottomMargin = false}) {
    showToastWidget(
      Container(
        width: 334,
        height: 56,
        margin: EdgeInsets.only(bottom: hasBottomMargin ? 50 : 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            SvgPicture.asset(
              'assets/icons/timer.svg',
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message ?? 'please_wait',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
      context: this,
      duration: const Duration(seconds: 3),
      animation: StyledToastAnimation.slideToBottomFade,
      reverseAnimation: StyledToastAnimation.slideToBottomFade,
    );
  }
}
