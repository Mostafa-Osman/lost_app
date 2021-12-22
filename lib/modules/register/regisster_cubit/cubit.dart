import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/register/regisster_cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isVisibility = true;
  bool confirmNotVisible = true;


  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(RegisterVisibilityPasswordState());
  }

  void confirmVisibilityPassword() {
    confirmNotVisible = !confirmNotVisible;
    emit(ConfirmRegisterVisibilityPasswordState());
  }
}
