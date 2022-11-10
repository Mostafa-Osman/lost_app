import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lost_app/app/common/widgets/default_app_button.dart';
import 'package:lottie/lottie.dart';

class NewVersionAlert extends StatelessWidget {
  final double? scale;
  final bool isRequired;

  const NewVersionAlert({
    this.scale,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      title: WillPopScope(
        onWillPop: () async => !isRequired,
        child: const SizedBox(),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/lottie/android-update-available.json',
            height: 200,
          ),
          Text(
            isRequired
                ? 'optional_update_title'
                : 'required_update_title',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(width: 15),
              _buildButton(
                context,
                buttonColor: Theme.of(context).primaryColor,
                title: 'update_now',
                onTap: () {
                  if (Platform.isAndroid) {
                    //_goToStore('https://mrenglish.app');
                  }
                  if (Platform.isIOS) {
                    // _goToStore('https://mrenglish.app');
                  }
                },
                flex: 14,
              ),
              if (!isRequired) const SizedBox(width: 20),
              const SizedBox(height: 12),
              if (!isRequired)
                _buildButton(
                  context,
                  buttonColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  title: 'update_later',
                  onTap: () => Navigator.pop(context),
                  flex: 12,
                  textColor: Theme.of(context).primaryColor,
                ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required Color buttonColor,
    required String title,
    required VoidCallback onTap,
    required int flex,
    Color textColor = Colors.white,
  }) =>
      DefaultAppButton(
        onPress: onTap,
        buttonColor: buttonColor,
        title: title,
        titleSize: 12,
        titleColor: textColor,
      );
}
