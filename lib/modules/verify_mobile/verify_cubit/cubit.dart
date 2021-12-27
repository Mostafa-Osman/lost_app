import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/verify_mobile/verify_cubit/states.dart';

class VerifyCubit extends Cubit<VerifyStates> {
  VerifyCubit() : super(VerifyInitialState());

  static VerifyCubit get(context) => BlocProvider.of(context);

  String flatButtonText = 'اعادة الارسال';
  bool isTimerOn = false;

  changeFlatButtonText(bool changeText) {
    if (changeText) {
      flatButtonText = 'لارسال الرمز مره اخري برجاء الانتظار';
      isTimerOn = true;
    } else {
      flatButtonText = 'اعادة الارسال';
      isTimerOn = false;
    }
    emit(ChangeButtonTextSuccess());
  }
}
