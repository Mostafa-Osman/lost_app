
import 'package:flutter/cupertino.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/timer.dart';

class OtpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialogClass(
      height: 260.0,
      widget: Column(
        children: const [
          TextClass(
            text: 'تهانينا لقد اتممت إنشاء',
          ),
          TextClass(
            text: 'الحساب بنجاح',
          ),
        ],
      ),
      bottomWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtonClass(
            onPressed: () => navigateTo(context, RouteConstant.homeLayoutRoute),
            text: 'الي الصفحه الرئيسيه',
            fontSize: 20,
          ),
          TimerClass(5, const Duration(milliseconds: 1000),
                () => navigateTo(context, RouteConstant.homeLayoutRoute),)
        ],
      ),
    );
  }
}
