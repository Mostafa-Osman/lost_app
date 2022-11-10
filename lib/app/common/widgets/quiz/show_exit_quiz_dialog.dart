import 'package:flutter/material.dart';
import 'package:lost_app/app/common/extensions/warning_alert.dart';

extension ExitQuizDialog on BuildContext {
  Future showExitQuizDialog() {
    return warningAlert(
      title: 'Are you sure to Exit Quiz? ',
      actionTitle: 'Yes, Exit',
      fallBackTitle: 'No, Stay',
      onTap: () {},
    );
  }
}
