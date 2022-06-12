import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';

import 'package:lost_app/shared/components/constant.dart';
import 'package:lost_app/shared/network/remote/puplish_multi_part.dart';

class CreatePostWebServices {
  final UserPrefs userPrefs;

  Future<Map<String, dynamic>> scanMainPhoto({
    required bool isLost,
    required File mainPhoto,
  }) async {
    log('toke is${userPrefs.getUserToken()}');
    //todo remove it after upload backend to server
    await Future.delayed(const Duration(seconds: 3));
    const String url = '${AppConst.baseUrl}search?start=0&limit=10';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': userPrefs.getUserToken(),
    };
    final body = {'isLost': isLost.toString()};
    final fields = {'data': jsonEncode(body)};
    final files = <MultipartFile>[];
    files.add(await getPartFromFile('main_photo', mainPhoto));
    final data = await postMultiPartRequest(
      url: url,
      fields: fields,
      files: files,
      headers: headers,
    );

    if (data['status'] == 200) {
      log(data.toString());
      return data['data']as Map<String,dynamic>;
    } else {
      throw data['message'].toString();
    }
  }

  const CreatePostWebServices(this.userPrefs);

  Future<Map<String, dynamic>> createPost({
    required String name,
    required int age,
    required String gender,
    required String governorate,
    required String city,
    String? addressDetails,
    required bool isLost,
    String? moreDetails,
    required File mainPhoto,
    required List<File> extraPhoto,
  }) async {
    //todo remove it after upload backend to server
    await Future.delayed(const Duration(seconds: 3));
    const String url = '${AppConst.baseUrl}create-post';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': userPrefs.getUserToken(),
    };
    final body = {
      'name': name,
      'age': age.toString(),
      'gender': gender,
      'city': governorate,
      'district': city,
      'address_details': moreDetails,
      'is_lost': isLost,
      'more_details': moreDetails,
    };
    final fields = {'data': jsonEncode(body)};
    final files = <MultipartFile>[];
    files.add(await getPartFromFile('main_photo', mainPhoto));
    if (extraPhoto.isNotEmpty) {
      files.addAll(await getPartsFromFiles('extra_photo', extraPhoto));
    }

    final data = await postMultiPartRequest(
      url: url,
      fields: fields,
      files: files,
      headers: headers,
    );
    if (data['status'] == 200) {
      log(data.toString());
      return data['data'] as Map<String, dynamic>;
    } else {
      throw data['message'].toString();
    }
  }
}
