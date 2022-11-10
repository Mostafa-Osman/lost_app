import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:lost_app/app/common/data/local/pref/user_pref.dart';
import 'package:lost_app/app/modules/post/data/models/create_post_dto.dart';
import 'package:lost_app/shared/components/constant.dart';
import 'package:lost_app/shared/network/remote/puplish_multi_part.dart';

class CreatePostWebServices {
  final UserPrefs userPrefs;

  Future<Map<String, dynamic>> scanMainPhoto({
    required bool isLost,
    required File mainPhoto,
  }) async {
    log('toke is${userPrefs.getUserToken()}');

    final String url = '${AppConst.baseUrl}search?start=0&limit=1000000';

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
      return data;
    } else {
      throw data['message'].toString();
    }
  }

  const CreatePostWebServices(this.userPrefs);

  Future<Map<String, dynamic>> setPost({
    required CreatePostDto createPostDto,
    bool isUpdatePost = false,
    int postId = 0,
  }) async {
    //todo remove it after upload backend to server
    await Future.delayed(const Duration(seconds: 3));


     final String url = isUpdatePost
        ? '${AppConst.baseUrl}update-post?post_id=$postId'
        : '${AppConst.baseUrl}create-post';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': userPrefs.getUserToken(),
    };
    final body = createPostDto.toMap();
    final fields = {'data': jsonEncode(body)};
    final files = <MultipartFile>[];
    files.add(
      await getPartFromFile('main_photo', createPostDto.mainPhoto),
    );
    if (createPostDto.extraPhoto.isNotEmpty) {
      files.addAll(await getPartsFromFiles(
        'extra_photos',
        createPostDto.extraPhoto,
      ),);
    }
    final data = await postMultiPartRequest(
      url: url,
      fields: fields,
      files: files,
      headers: headers,
      method: isUpdatePost ? 'PUT' : 'POST',
    );
    if (data['status'] == 200) {
      log(data.toString());
      //
      return data['data'] as Map<String, dynamic>;
    } else {
      throw data['message'].toString();
    }
  }
}
