

import 'package:lost_app/data/local/pref/pref_setup.dart';
import 'package:lost_app/presentations/route/route_constants.dart';

class RoutingPrefs {
  RoutingPrefs._();

  static void setOnBoardingSeen() => SharedPrefs.instance.setBool("seen", true);

  static bool isOnBoardingSeen() =>
      SharedPrefs.instance.getBool("seen") ?? false;

  static String getInitialRoute() =>
      isOnBoardingSeen() == true
      ? RouteConstant.homeLayoutRoute/*homeLayoutRoute*/
      : RouteConstant.onBoardingRoute;
}
