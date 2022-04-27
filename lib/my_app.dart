import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lost_app/modules/add_person_data/add_person_cubit/add_person_cubit.dart';
import 'package:lost_app/modules/home_layout/home_layout_cubit/home_cubit.dart';
import 'package:lost_app/modules/login/login_cubit/login_cubit.dart';
import 'package:lost_app/modules/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:lost_app/modules/on_boarding/ui/on_boarding.dart';
import 'package:lost_app/modules/profile/profile_cubit/profile_cubit.dart';
import 'package:lost_app/modules/register/register_cubit/register_cubit.dart';
import 'package:lost_app/modules/route/router.dart';
import 'package:lost_app/modules/search/search_cubit/search_cubit.dart';
import 'package:lost_app/modules/setting/setting_cubit/setting_cubit.dart';
import 'package:lost_app/modules/verify_mobile/verify_cubit/verify_cubit.dart';


class MyApp extends StatelessWidget {
  final AppRouter appRoutes;

  final registerBloc = RegisterCubit();
  final loginBloc = LoginCubit();
  final addPersonDataBloc = AddPersonDataCubit();
  final onBoardingCubit = OnBoardingCubit();
  final searchCubit = SearchCubit();
  final settingCubit = SettingCubit();
  final verifyCubit = VerifyCubit();
  final profileCubit = ProfileCubit();
  final homeLayoutCubit = HomeLayoutCubit();

   MyApp({Key? key, required this.appRoutes}) : super(key: key);

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
            onGenerateRoute: appRoutes.generateRoute,
            // to make app all support  arabic language
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', ''),
            ],
            home: OnBoardingScreen(),),);
  }

}
