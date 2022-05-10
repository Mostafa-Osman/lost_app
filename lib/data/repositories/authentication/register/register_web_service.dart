import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lost_app/shared/components/contstans.dart';

class RegisterWebService {
  Future<Map<String, dynamic>> register({
    required String username,
    required String phone,
    required String password,
    required String email,
  }) async {
    const String url = '${AppConst.baseUrl}sign';
    final Map<String, dynamic> registerMap = {
      'username': username,
      'phone_number': phone,
      'email':email,
      'password': password,
      'confirm_password': password,
    };
    final http.Response response =
        await http.post(Uri.parse(url), body: registerMap);

    final data = json.decode(response.body) as Map<String, dynamic>;

    if (data['status'] == 200) {
      return data;
    } else {
      throw data['message'].toString();
    }
  }
}
