import 'package:flutter/material.dart';

import 'package:lost_app/app/common/widgets/default_app_button.dart';

void noInternetAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/no_internet_alert.png'),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Internet Connection Lost',
              style: TextStyle(
                color: Color(0xFF463C4B),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Your Internet connection has been lost, please try again later',
              style: TextStyle(
                color: Color(0xFF7B7C7D),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultAppButton(
              title: 'Retry',
              onPress: () => Navigator.pop(context),
              width: 174,
              height: 40,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}
