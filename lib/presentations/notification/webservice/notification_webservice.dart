import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';
import 'package:lost_app/presentations/notification/notificatin_model.dart';
import 'package:lost_app/shared/components/constant.dart';

class NotificationWebService {
  Future<List<NotificationModel>> getNotifications() async {
    String url = '${AppConst.baseUrl}get-notifications';

    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': UserPrefs().getUserToken(),
    };

    final response = await get(
      Uri.parse(url),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    if (data['status'] == 200) {
      return (data['notifications'] as List)
          .map((e) => NotificationModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } else {
      throw data['message'].toString();
    }
  }
}
