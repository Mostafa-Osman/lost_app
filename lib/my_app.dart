import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/add_person_data/add_person_cubit/cubit.dart';
import 'package:lost_app/modules/home_layout/home_layout_cubit/cubit.dart';
import 'package:lost_app/modules/login/login_cubit/cubit.dart';
import 'package:lost_app/modules/on_boarding/on_boarding_cubit/cubit.dart';
import 'package:lost_app/modules/on_boarding/ui/on_boarding.dart';
import 'package:lost_app/modules/profile/profile_cubit/cubit.dart';
import 'package:lost_app/modules/register/register_cubit/cubit.dart';
import 'package:lost_app/modules/route/router.dart';
import 'package:lost_app/modules/search/search_cubit/cubit.dart';
import 'package:lost_app/modules/setting/setting_cubit/cubit.dart';
import 'package:lost_app/modules/verify_mobile/verify_cubit/cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {

  final registerBloc = RegisterCubit();
  final loginBloc = LoginCubit();
  final addPersonDataBloc = AddPersonDataCubit();
  final onBoardingCubit = OnBoardingCubit();
  final searchCubit = SearchCubit();
  final settingCubit = SettingCubit();
  final verifyCubit = VerifyCubit();
  final profileCubit = ProfileCubit();
  final homeLayoutCubit = HomeLayoutCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => onBoardingCubit),
          BlocProvider(create: (context) => loginBloc),
          BlocProvider(create: (context) => registerBloc),
          BlocProvider(create: (context) => addPersonDataBloc),
          BlocProvider(create: (context) => searchCubit),
          BlocProvider(create: (context) => settingCubit),
          BlocProvider(create: (context) => verifyCubit),
          BlocProvider(create: (context) => profileCubit),
          BlocProvider(create: (context) => homeLayoutCubit),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            // to make app all support  arabic language
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ar', ''),
            ],
            home: OnBoardingScreen()));
  }

}
