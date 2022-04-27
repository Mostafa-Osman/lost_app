import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'setting_states.dart';
class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(BuildContext context) => BlocProvider.of(context);

  // variable bool to change mode
  bool isDark = false;

  // method to switch mode
  void changeMode() {
    isDark = !isDark;
    emit(SettingModeIsDarkState());
  }
}
