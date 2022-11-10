import 'package:lost_app/app/common/data/local/pref/user_pref.dart';

class AppConst {
  static String get base => UserPrefs().getBaseUrl();

  static String baseUrl = "$base:5000/";
  static String imageUrl = "$base:5550/";
  AppConst._();
}

String token = '';
dynamic onBoarding;
