import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/forget_password/reset_password_cubit/reset_password_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/timer.dart';
import 'package:lost_app/shared/styles/color.dart';

class ResetPasswordDialog extends StatelessWidget {
  const ResetPasswordDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialogClass(
      height: 260.0,
      widget: Column(
        children: const [
          TextClass(
            text: 'تهانينا لقد قمت بإعاده تعيين',
          ),
          TextClass(
            text: 'كلمه المرور بنجاح',
          ),
        ],
      ),
      bottomWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtonClass(
            onPressed: () {
              BlocProvider.of<ResetPasswordCubit>(context)
                  .checkTimerCanceled(status: true);
              navigatorAndFinish(context, RouteConstant.homeLayoutRoute);
            },
            text: 'الي الصفحه الرئيسيه',
            fontSize: 20,
            textColor: mainColor,
          ),
          // Timer with 5 second to go home screen automatic
          TimerClass(
            seconds: 5,
            interval: const Duration(milliseconds: 1000),
            onFinished: () {
              BlocProvider.of<ResetPasswordCubit>(context)
                  .checkTimerCanceled(status: true);
              navigatorAndFinish(context, RouteConstant.homeLayoutRoute);
            },
          ),
        ],
      ),
    );
  }
}
