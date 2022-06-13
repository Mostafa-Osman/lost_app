import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/home/presentation/screen/home_screen.dart';
import 'package:lost_app/presentations/profile/presentation/screen/profile_screen.dart';
import 'package:lost_app/shared/components/appbar_widget.dart';
import 'package:lost_app/shared/styles/color.dart';

part 'home_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());

  static HomeLayoutCubit get(BuildContext context) => BlocProvider.of(context);
  int indexPage = 0;
  bool scrollDown = false;
  Color bottomNavBarAccColor = grey;
  Color bottomNavBarHomeColor = bottomNavBarBlue;
  Map<int, PreferredSizeWidget> appBar = {
    0: HomePageAppBar(),
    1: AccountPageAppBar(),
  };
  Map<int, Widget> page = {
    0: HomeScreen(),
    1: ProfileScreen(),
  };

  void changeBottomNavBarIndexAndColor(int index) {
    if (index == 0) {
      bottomNavBarAccColor = bottomNavBarBlue;
      bottomNavBarHomeColor = grey;
      indexPage = 1;
    } else {
      bottomNavBarAccColor = grey;
      bottomNavBarHomeColor = bottomNavBarBlue;
      indexPage = 0;
    }
    emit(ChangeBottomNavBarIndexAndColorState());
  }

  void scrollDirection({required bool scroll}){
    if(scrollDown != scroll){
      scrollDown = scroll;
      emit(HomeLayoutSuccessState());
    }
  }
}
