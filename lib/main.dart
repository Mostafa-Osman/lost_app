import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lost_app/modules/home_layout/home_layout.dart';
import 'package:lost_app/modules/search/search_cubit/cubit.dart';
import 'package:lost_app/modules/setting/setting_cubit/cubit.dart';
import 'modules/add_person_data/add_person_cubit/cubit.dart';
import 'modules/login/login_cubit/cubit.dart';
import 'modules/on_boarding/on_boarding_cubit/cubit.dart';
import 'modules/profile/profile_cubit/cubit.dart';
import 'modules/register/register_cubit/cubit.dart';
import 'modules/verify_mobile/ui/Verify_mobile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => AddPersonDataCubit()),
          BlocProvider(create: (context) => OnBoardingCubit()),
          BlocProvider(create: (context) => SearchCubit()),
          BlocProvider(create: (context) => SettingCubit()),
          BlocProvider(create: (context) => ProfileCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // to make app all support  arabic language
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ar', ''),
          ],
          home: HomeLayout(),
        ));
  }
}
