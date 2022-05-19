import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/home/ui/home.dart';
import 'package:lost_app/profile/screen/profile.dart';
import 'package:lost_app/shared/components/appbar_widget.dart';
import 'package:lost_app/shared/styles/color.dart';
part 'home_states.dart';
class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());

  static HomeLayoutCubit get(BuildContext context) => BlocProvider.of( context);
  int indexPage = 0;

   Color bottomNavBarAccColor = grey;
   Color bottomNavBarHomeColor = bottomNavBarBlue;
  Map<int, PreferredSizeWidget> appBar = {
    0: HomePageAppBar(),
    1: AccountPageAppBar(),
  };
  Map<int, Widget> page = {
    0: HomeClass(),
    1: ProfileClass(),
  };

  void changeBottomNavBarIndexAndColor(int index) {
    if (index == 0) {
      bottomNavBarAccColor = bottomNavBarBlue;
      bottomNavBarHomeColor = grey;
      indexPage = 1;
    }
    else {
      bottomNavBarAccColor = grey;
      bottomNavBarHomeColor = bottomNavBarBlue;
      indexPage = 0;
    }
    emit(ChangeBottomNavBarIndexAndColorState());
  }
}
