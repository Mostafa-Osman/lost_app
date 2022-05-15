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
  await SharedPrefs.init();
  log('token:$userToken');
  log('onBoarding:$onBoarding');
  BlocOverrides.runZoned(
          () {
  runApp(
    MyApp(
      appRoutes: AppRouter(),
      initialRoute: RoutingPrefs.getInitialRoute(),
    ),
  );
          },
    blocObserver: MyBlocObserver(),
  );
}
