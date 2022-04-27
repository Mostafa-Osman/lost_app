import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_states.dart';
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  // variable bool to change visibility
  bool isVisibility = true;

  // variable bool to change visibility in (confirm field)
  bool confirmNotVisible = true;

  // method to switch icon visibility
  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(RegisterVisibilityPasswordState());
  }

  // method to switch icon visibility (in confirm password field )
  void confirmVisibilityPassword() {
    confirmNotVisible = !confirmNotVisible;
    emit(ConfirmRegisterVisibilityPasswordState());
  }
}
