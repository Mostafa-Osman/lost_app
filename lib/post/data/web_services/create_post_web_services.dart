import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:lost_app/data/local/pref/user_pref.dart';

import 'package:lost_app/shared/components/constant.dart';

class CreatePostWebServices {
  final UserPrefs userPrefs;

  const CreatePostWebServices(this.userPrefs);

  Future<void> createPost({
    required String name,
    required int age,
    required String gender,
    required String governorate,
    required String city,
    String? addressDetails,
    required bool isLost,
    String? moreDetails,
    required String mainPhoto,
    required List<String> extraPhoto,
  }) async {
    log('toke is${userPrefs.getUserToken()}');
    //todo remove it after upload backend to server

      await Future.delayed(const Duration(seconds: 3));

    const String url = '${AppConst.baseUrl}create-post';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': userPrefs.getUserToken(),
    };

    final registerBody = {
      'name': name,
      'age': age,
      'gender': gender,
      'city': governorate,
      'district': city,
      'address_details': addressDetails ?? '',
      'is_lost': isLost,
      'more_details': moreDetails ?? '',
      'main_photo': mainPhoto,
      'extra_photo': '', // extraPhoto,
    };
    final response = await http.post(
      Uri.parse(url),
      body: const Utf8Encoder().convert(
        jsonEncode(registerBody),
      ),
      headers: headers,
    );
    json.decode(response.body) as Map<String, dynamic>;
  }
}
