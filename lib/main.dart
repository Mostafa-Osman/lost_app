import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lost_app/authentication/presentation/login/screen/login.dart';
import 'package:lost_app/data/local/cash_helper.dart';
import 'package:lost_app/my_app.dart';
import 'package:lost_app/presentations/home_layout/ui/home_layout.dart';
import 'package:lost_app/presentations/on_boarding/ui/on_boarding.dart';
import 'package:lost_app/presentations/route/router.dart';
import 'package:lost_app/shared/components/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  Widget widget;
  onBoarding = CacheHelper.getData(key: 'onBoarding');

  token = CacheHelper.getUserToken();
  log('token:$token');
  log('onBoarding:$onBoarding');


  // (onBoarding==null)
  //     ? widget = OnBoardingScreen()
  //     : (token.isEmpty)
  //         ? widget = LoginScreen()
  //         : widget = HomeLayoutScreen();
  widget = HomeLayoutScreen();

  runApp(
    MyApp(
      appRoutes: AppRouter(),
      widget: widget,
    ),
  );
}
