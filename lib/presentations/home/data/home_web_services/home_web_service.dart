import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';
import 'package:lost_app/shared/components/constant.dart';


class HomeWebService {

  UserPrefs userPrefs;
  Dio dio = Dio();
  HomeWebService(this.userPrefs);

  Future<Map<String, dynamic>> getHomePosts(int startLimit) async {
    final response = await dio.get(
      '${AppConst.baseUrl}get-all-posts?start=$startLimit&limit=10',
      options: Options(
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': userPrefs.getUserToken(),
        },
      ),
    );
    final data = response.data as Map<String, dynamic>;
    //
    // // todo: fake data
    // final data = homeFakeResponse;
    // await Future.delayed(const Duration(seconds: 3));
    // // todo: end of fake data
    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> deletePost(int postId) async {
    final response = await dio.delete(
      '${AppConst.baseUrl}delete-post?post_id=$postId',
      options: Options(
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': userPrefs.getUserToken(),
        },
      ),
    );
    final data = response.data as Map<String, dynamic>;


    // // todo: fake data
    // final data = deletePostFakeResponse;
    // await Future.delayed(const Duration(seconds: 3));
    // // todo: end of fake data

    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> savePost(int postId) async {
    final response = await dio.post(
      '${AppConst.baseUrl}save-post?post_id=$postId',
      options: Options(
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': userPrefs.getUserToken(),
        },
      ),
    );
    final data = response.data as Map<String, dynamic>;

    // // todo: fake data
    // final data = savePostFakeResponse;
    // await Future.delayed(const Duration(seconds: 3));
    // // todo: end of fake data

    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> unSavePost(int postId) async {
    final response = await dio.delete(
      '${AppConst.baseUrl}unsave-post?post_id=$postId',
      options: Options(
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': userPrefs.getUserToken(),
        },
      ),
    );
    final data = response.data as Map<String, dynamic>;

    // // todo: fake data
    // final data = unSavePostFakeResponse;
    // await Future.delayed(const Duration(seconds: 3));
    // // todo: end of fake data

    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }
}


final deletePostFakeResponse = {
  "message": "تم حذف المنشور بنجاح",
  "status": 200
};
final savePostFakeResponse = {
  "message": "تم إضافة المنشور إلى منشوراتك المحفوظة",
  "status": 200
};
final unSavePostFakeResponse = {
  "message": "تم إزالة المنشور من منشوراتك المحفوظة",
  "status": 200
};
