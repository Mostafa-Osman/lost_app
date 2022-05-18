import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/constant/constant.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/timer.dart';
import 'package:lost_app/shared/components/toast.dart';

class OtpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          navigateTo(context, RouteConstant.homeLayoutRoute);
        } else if (state is LoginError) {
          showToast(message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
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
                onPressed: () => (userData.data.token != null)
                    ? navigateTo(context, RouteConstant.homeLayoutRoute)
                    : null,
                text: 'الي الصفحه الرئيسيه',
                fontSize: 20,
              ),
              TimerClass(
                seconds: 5,
                interval: const Duration(milliseconds: 1000),
                onFinished: () {
                  if (userData.data.token != null) {
                    navigateTo(context, RouteConstant.homeLayoutRoute);
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
