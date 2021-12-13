import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lost_app/modules/home/bottom_navigation_bar.dart';
import 'package:lost_app/modules/home/comment_screen.dart';

import 'modules/login/enter_phone_number.dart';
import 'modules/login/Verify_mobile.dart';
import 'modules/login/login.dart';
import 'modules/login/reset_password.dart';
import 'modules/on_boarding/on_boarding.dart';
import 'modules/posts_found/posts_found.dart';

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
        primarySwatch: Colors.blue,
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
      home: PostsFoundScreen(),
    );
  }
}
