import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lost_app/modules/login/ui/login.dart';
import 'modules/home_layout/home_layout.dart';
import 'modules/login/login_cubit/cubit.dart';
import 'modules/lost_person_data/ui/lost_person_data.dart';
import 'modules/register/regisster_cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => RegisterCubit()),

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
