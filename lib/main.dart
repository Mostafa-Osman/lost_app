import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lost_app/modules/home/bottom_navigation_bar.dart';
import 'package:lost_app/modules/login/login.dart';
import 'package:lost_app/modules/login/reset_password.dart';
import 'package:lost_app/modules/register/register.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'modules/lost_person_data/lost_person_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: white),
        ),
      ),

      // to make app all support  arabic language
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', ''),
      ],
      home: LoginScreen(),
    );
  }
}
