import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';

class PostDetailsWebService {
  UserPrefs userPrefs;
  Dio dio = Dio();

  PostDetailsWebService(this.userPrefs);

  Future<Map<String, dynamic>> getPostData(int postId) async {
    // final response = await dio.get(
    //   '${AppConst.baseUrl}click-post?post_id=$postId',
    //   options: Options(
    //     headers: {
    //       'Content-Type': 'application/json;charset=UTF-8',
    //       'Authorization': userPrefs.getUserToken(),
    //     },
    //   ),
    // );
    // final data = response.data as Map<String, dynamic>;

    // todo: fake data
    final data = postFakeResponse;
    await Future.delayed(const Duration(seconds: 3));
    // todo: end of fake data
    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> deleteComment({
    required int postId,
    required int commentId,
    required int parentCommentId,
  }) async {
    // final response = await dio.delete(
    //   '${AppConst.baseUrl}delete-comment?post_id=$postId&parent_id=$parentCommentId&comment_id=$commentId',
    //   options: Options(
    //     headers: {
    //       'Content-Type': 'application/json;charset=UTF-8',
    //       'Authorization': userPrefs.getUserToken(),
    //     },
    //   ),
    // );
    // final data = response.data as Map<String, dynamic>;

    // todo: fake data
    final data = deleteCommentFakeResponse;
    await Future.delayed(const Duration(seconds: 3));
    // todo: end of fake data

    log("Profile data: ${data.toString()}");
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> createComment({
    required int postId,
    required int parentCommentId,
    required String content,
  }) async {
    // final response = await dio.post(
    //   '${AppConst.baseUrl}create-comment?post_id=$postId&parent_id=$parentCommentId',
    //   options: Options(
    //     headers: {
    //       'Content-Type': 'application/json;charset=UTF-8',
    //       'Authorization': userPrefs.getUserToken(),
    //     },
    //   ),
    //   data: {
    //     'content': content,
    //   },
    // );
    // final data = response.data as Map<String, dynamic>;

    // todo: fake data
    final data = createCommentFakeResponse;
    await Future.delayed(const Duration(seconds: 3));
    // todo: end of fake data

    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> updateComment({
    required int postId,
    required int commentId,
    required int parentCommentId,
    required String content,
  }) async {
    // final response = await dio.put(
    //   '${AppConst.baseUrl}update-comment?post_id=$postId&parent_id=$parentCommentId&comment_id=$commentId',
    //   options: Options(
    //     headers: {
    //       'Content-Type': 'application/json;charset=UTF-8',
    //       'Authorization': userPrefs.getUserToken(),
    //     },
    //   ),
    //   data: {
    //     'content': content,
    //   },
    // );
    // final data = response.data as Map<String, dynamic>;




    // todo: fake data
    final data = createCommentFakeResponse;
    await Future.delayed(const Duration(seconds: 3));
    // todo: end of fake data

    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }
}

final postFakeResponse = {
  "post": {
    "comments": [
      {
        "Content": "comment 1",
        "comment_id": 5,
        "date": "Tue, 17 May 2022 07:58:49 GMT",
        "is_owner": true,
        "photo":
            "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "replies": [
          {
            "Content": "reply 1 on comment 1",
            "comment_id": 8,
            "date": "Tue, 17 May 2022 08:05:16 GMT",
            "is_owner": true,
            "photo":
                "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            "username": "Mohamed Ali"
          },
          {
            "Content": "reply 2 on comment 1",
            "comment_id": 10,
            "date": "Tue, 17 May 2022 08:05:16 GMT",
            "is_owner": false,
            "photo":
                "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            "username": "Sara Adel"
          }
        ],
        "username": "Maha Salem"
      },
      {
        "Content": "comment 2",
        "comment_id": 8,
        "date": "Tue, 17 May 2022 08:05:16 GMT",
        "is_owner": false,
        "photo":
            "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "replies": [
          {
            "Content": "reply 1 on comment 2",
            "comment_id": 8,
            "date": "Tue, 17 May 2022 08:05:16 GMT",
            "is_owner": true,
            "photo":
                "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            "username": "Mohamed Ali"
          }
        ],
        "username": "Moamen Khaled"
      }
    ],
    "date": "Sat, 14 May 2022 22:48:28 GMT",
    "details":
        "The survivors of a plane crash find themselves stranded on a mysterious island. They are forced to work together for their survival when they realise that they are not alone on the island.",
    "is_lost": true,
    "is_owner": true,
    "is_saved": true,
    "person_data": {
      "address": {
        "address_details": "Dahshur Dahshur Dahshur Dahshur Dahshur Dahshur",
        "city": "Alex",
        "district": "Al-Montazah"
      },
      "age": 16,
      "extra_photos": [
        "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      ],
      "gender": "female",
      "main_photo":
          "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "person_name": "Mariam Ahmed"
    },
    "post_id": 10,
    "user_id": 2,
    "user_phone_number": "01198756127",
    "user_photo":
        "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "username": "Mohamed Ali"
  },
  "status": 200
};
final createCommentFakeResponse = {
  "data": {
    "Content": "This is the initial comment",
    "date": "Tue, 17 May 2022 06:01:48 GMT",
    "post_id": 9,
    "comment_id": 10,
    "user_id": 2,
    "photo":
        "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "username": "Mohamed Ali"
  },
  "message": "تم نشر التعليق بنجاح",
  "status": 200
};
final deleteCommentFakeResponse = {
  "message": "تم حذف التعليق بنجاح",
  "status": 200
};
