
import 'package:lost_app/app/common/data/local/pref/pref_setup.dart';
import 'package:lost_app/app/router/route_names.dart';

class RoutingPrefs {
  RoutingPrefs._();

  static void setOnBoardingSeen() => SharedPrefs.instance.setBool("seen", true);

  static bool isOnBoardingSeen() =>
      SharedPrefs.instance.getBool("seen") ?? false;

  static String getInitialRoute() => isOnBoardingSeen() == true
      ? RouteConstant.homeLayoutRoute
      : RouteConstant.onBoardingRoute;
}
