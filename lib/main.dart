
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/data/local/pref/pref_setup.dart';
import 'package:lost_app/data/local/pref/routing_pref.dart';
import 'package:lost_app/my_app.dart';
import 'package:lost_app/my_bloc_observer.dart';
import 'package:lost_app/presentations/route/router.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.init();
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
