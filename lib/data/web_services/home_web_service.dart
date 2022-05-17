import 'dart:developer';

import 'package:lost_app/shared/components/constant.dart';
import 'package:lost_app/shared/network/remote/dio_helper.dart';

class HomeWebService {
  Future<Map<String, dynamic>> getHomePosts(int startLimit) async {
    // final response = await DioHelper.getData(
    //   url: '${AppConst.baseUrl}get-all-posts?start=$startLimit&limit=10',
    // );
    // final data = response?.data as Map<String, dynamic>;

    // todo: fake data
    final data = homeFakeResponse;
    await Future.delayed(const Duration(seconds: 3));
    // todo: end of fake data
    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }
  Future<Map<String, dynamic>> getPostData(int postId) async {
    // final response = await DioHelper.getData(
    //   url: '${AppConst.baseUrl}click-post?post_id=$postId',
    // );
    // final data = response?.data as Map<String, dynamic>;

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

  Future<Map<String, dynamic>> deletePost(int postId) async {
    // final response = await DioHelper.getData(
    //   url: '${AppConst.baseUrl}delete-post?post_id=$postId',
    // );
    // final data = response?.data as Map<String, dynamic>;

    // todo: fake data
    final data = deletePostFakeResponse;
    await Future.delayed(const Duration(seconds: 3));
    // todo: end of fake data

    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> savePost(int postId) async {
    // final response = await DioHelper.getData(
    //   url: '${AppConst.baseUrl}save-post?post_id=$postId',
    // );
    // final data = response?.data as Map<String, dynamic>;

    // todo: fake data
    final data = savePostFakeResponse;
    await Future.delayed(const Duration(seconds: 3));
    // todo: end of fake data

    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> unSavePost(int postId) async {
    // final response = await DioHelper.getData(
    //   url: '${AppConst.baseUrl}unsave-post?post_id=$postId',
    // );
    // final data = response?.data as Map<String, dynamic>;

    // todo: fake data
    final data = unSavePostFakeResponse;
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

final homeFakeResponse = {
  "posts": [
    {
      "date": "Sat, 14 May 2022 22:45:45 GMT",
      "details": "",
      "is_lost": false,
      "is_owner": false,
      "is_saved": false,
      "person_data": {
        "address": {
          "address_details": "",
          "city": "Cairo ",
          "district": "Zamalek"
        },
        "age": 8,
        "gender": "male",
        "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "person_name": "fouad ali"
      },
      "post_id": 9,
      "user_id": 1,
      "user_phone_number": "01198752345",
      "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "username": "Moamen Khaled"
    },
    {
      "date": "Sat, 14 May 2022 22:48:28 GMT",
      "details": "",
      "is_lost": true,
      "is_owner": true,
      "is_saved": true,
      "person_data": {
        "address": {
          "address_details": "",
          "city": "Alex",
          "district": "Al-Montazah"
        },
        "age": 16,
        "gender": "female",
        "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "person_name": "Mariam Ahmed"
      },
      "post_id": 10,
      "user_id": 2,
      "user_phone_number": "01198756127",
      "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "username": "Mohamed Ali"
    },
    {
      "date": "Sun, 15 May 2022 01:37:56 GMT",
      "details": "",
      "is_lost": true,
      "is_owner": false,
      "is_saved": false,
      "person_data": {
        "address": {
          "address_details": "",
          "city": "Giza",
          "district": "Maadi"
        },
        "age": 12,
        "gender": "female",
        "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "person_name": "Hala Ahmed"
      },
      "post_id": 11,
      "user_id": 3,
      "user_phone_number": "01246932712",
      "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "username": "Sara Adel"
    },
    {
      "date": "Sun, 15 May 2022 01:39:06 GMT",
      "details": "",
      "is_lost": false,
      "is_owner": false,
      "is_saved": true,
      "person_data": {
        "address": {
          "address_details": "",
          "city": "Giza",
          "district": "Maadi"
        },
        "age": 10,
        "gender": "male",
        "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "person_name": "Hosam Hany"
      },
      "post_id": 12,
      "user_id": 3,
      "user_phone_number": "01246932712",
      "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "username": "Sara Adel"
    }
  ],
  "status": 200
};
final postFakeResponse = {
  "post": {
    "comments": [
      {
        "Content": "comment 1",
        "id": 5,
        "photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "replies": [
          {
            "Content": "reply 1 on comment 1",
            "id": 8,
            "photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            "username": "Mohamed Ali"
          },
          {
            "Content": "reply 2 on comment 1",
            "id": 10,
            "photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            "username": "Sara Adel"
          }
        ],
        "username": "Maha Salem"
      },
      {
        "Content": "comment 2",
        "id": 6,
        "photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "replies": [
          {
            "Content": "reply 1 on comment 2",
            "id": 9,
            "photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            "username": "Mohamed Ali"
          }
        ],
        "username": "Moamen Khaled"
      }
    ],
    "date": "Sat, 14 May 2022 22:48:28 GMT",
    "details": "The survivors of a plane crash find themselves stranded on a mysterious island. They are forced to work together for their survival when they realise that they are not alone on the island.",
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
      "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "person_name": "Mariam Ahmed"
    },
    "post_id": 10,
    "user_id": 2,
    "user_phone_number": "01198756127",
    "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "username": "Mohamed Ali"
  },
  "status": 200
};

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
