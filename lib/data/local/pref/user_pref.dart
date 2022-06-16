import 'dart:developer';
import 'package:lost_app/constant/constant.dart';
import 'package:lost_app/data/local/pref/pref_setup.dart';

class UserPrefs {
  final prefs = SharedPrefs.instance;

  // Future<void> saveUserData(Map<String, dynamic>? userData) async {
  //   await prefs.setString("userData", jsonEncode(userData));
  // }

  // Future<ProfileModel> getUserProfile() async {
  //   log(prefs.getString("userData")!);
  //   final user =
  //       await jsonDecode(prefs.getString("userData")!) as Map<String, dynamic>;
  //   return ProfileModel.fromJson(user);
  // }

  Future<void> setUserToken(String token) => prefs.setString(userToken, token);

  String getUserToken() => prefs.getString(userToken) ?? 'error token';

  Future<void> deleteUserToken() async => prefs.remove(userToken);

  String getBaseUrl() => prefs.getString('url') ?? 'http://192.168.1.4/';
  Future<void> setBaseUrl(String newUrl) => prefs.setString('url', newUrl);
  // Future<void> saveAccountChanges({
  //   required String name,
  //   required String birthdate,
  // }) async {
  //   final userData =
  //       await jsonDecode(prefs.getString("userData")!) as Map<String, dynamic>;
  //   userData['fullName'] = name;
  //   userData['birthDate'] = birthdate;
  //   await saveUserData(userData);
  // }

  bool isUserLoggedIn() {
    final token = prefs.getString("token");
    log(token.toString());
    return token != null;
  }
}
