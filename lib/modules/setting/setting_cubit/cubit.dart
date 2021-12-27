import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/setting/setting_cubit/states.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  // variable bool to change mode
  bool isDark = false;

  // method to switch mode
  void changeMode() {
    isDark = !isDark;
    emit(SettingModeIsDarkState());
  }
}
