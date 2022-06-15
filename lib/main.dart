import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/data/local/pref/pref_setup.dart';
import 'package:lost_app/data/local/pref/routing_pref.dart';
import 'package:lost_app/my_app.dart';
import 'package:lost_app/my_bloc_observer.dart';
import 'package:lost_app/presentations/route/router.dart';
import 'package:lost_app/services/navigation_services.dart';
import 'package:lost_app/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SharedPrefs.init();
  NavigationService().setupLocator();
  await initializeNotification();
  FirebaseMessaging.onBackgroundMessage(
    NotificationsService.firebaseMessagingNotificationHandler,
  );
  NotificationsService().init();
  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

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
