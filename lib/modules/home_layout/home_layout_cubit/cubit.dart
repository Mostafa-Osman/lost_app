
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/home_layout/home_layout_cubit/states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());
  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  // bool isVisibility = true;
  //
  // void visibilityPassword() {
  //   isVisibility = !isVisibility;
  //   emit(LoginVisibilityPasswordState());
  // }
}