import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lost_app/app/common/data/local/pref/routing_pref.dart';

GetIt locator = GetIt.instance;

class NavigationService {
  final GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  void setupLocator() {
    locator.registerLazySingleton(() => NavigationService());
  }

  Future<dynamic> navigateTo(String routeName, Object? argument) {
    return navigatorKey!.currentState!
        .pushNamed(routeName, arguments: argument);
  }

  Future openApp() async {
    final bool isSuccess = false;
    // navigatorKey!.currentState!.popUntil((route) {
    //   if (route.settings.name == Routes.BOTTOM_NAVIGATION) {
    //     isSuccess = true;
    //     return true;
    //   }
    //   return false;
    // });
    if (!isSuccess) {
      navigatorKey!.currentState!.pushNamedAndRemoveUntil(
        RoutingPrefs.getInitialRoute(),
        (route) => false,
      );
    }
  }
}
