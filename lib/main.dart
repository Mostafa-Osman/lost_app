import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lost_app/modules/home_layout/home_layout.dart';
import 'package:lost_app/modules/processing/processing_page.dart';
import 'package:lost_app/modules/splash/splash_screen.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'modules/add_person_data/add_person_cubit/cubit.dart';
import 'modules/add_person_data/ui/add_person_data.dart';
import 'modules/login/login_cubit/cubit.dart';
import 'modules/post/post.dart';
import 'modules/posts_found/ui/posts_found.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => AddPersonDataCubit()),

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
          home: AddPersonDataScreen(),
        ));
  }
}
