import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'verfiy_states.dart';
class VerifyCubit extends Cubit<VerifyStates> {
  VerifyCubit() : super(VerifyInitialState());

  static VerifyCubit get(BuildContext context) => BlocProvider.of(context);

  String flatButtonText = 'اعادة الارسال';
  bool isTimerOn = false;

  void changeFlatButtonText({required bool changeText}) {
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
