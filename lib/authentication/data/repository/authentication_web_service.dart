import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lost_app/shared/components/constant.dart';

class AuthenticationWebService {
  Future<Map<String, dynamic>> register({
    required String username,
    required String phone,
    required String password,
    required String email,
  }) async {
    //todo remove it after upload backend to server

    await Future.delayed(const Duration(seconds: 3));

    const String url = '${AppConst.baseUrl}register';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
    };

    final registerBody = {
      'username': username,
      'phone_number': phone,
      'email': email,
      'password': password,
      'confirm_password': password,
    };
    final response = await http.post(
      Uri.parse(url),
      body: const Utf8Encoder().convert(
        jsonEncode(registerBody),
      ),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    if (data['status'] == 200) {
      log(data.toString());
      return data;
    } else {
      throw data['message'].toString();
    }
  }

  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  }) async {

    //todo remove it after upload backend to server
    await Future.delayed(const Duration(seconds: 3));
    const String url = '${AppConst.baseUrl}login';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
    };

    final loginBody = {
      'phone_number': phone,
      'password': password,
    };
    final response = await http.post(
      Uri.parse(url),
      body: const Utf8Encoder().convert(
        jsonEncode(loginBody),
      ),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    if (data['status'] == 200) {
      log(data.toString());
      return data;
    } else {
      throw data['message'].toString();
    }
  }
}
