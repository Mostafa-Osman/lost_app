import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:lost_app/app/common/data/local/pref/user_pref.dart';
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

// final homeFakeResponse = {
//   "posts": [
//     {
//       "date": "Sat, 14 May 2022 22:45:45 GMT",
//       "details": "",
//       "is_lost": false,
//       "is_owner": false,
//       "is_saved": false,
//       "person_data": {
//         "address": {
//           "address_details": "",
//           "city": "Cairo ",
//           "district": "Zamalek"
//         },
//         "age": 8,
//         "gender": "male",
//         "main_photo":
//             "photos/1462453423756.jpg",
//         "person_name": "fouad ali"
//       },
//       "post_id": 9,
//       "user_id": 1,
//       "user_phone_number": "01198752345",
//       "user_photo":
//           "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       "username": "Moamen Khaled"
//     },
//     {
//       "date": "Sat, 15 May 2022 20:48:28 GMT",
//       "details": "",
//       "is_lost": true,
//       "is_owner": true,
//       "is_saved": true,
//       "person_data": {
//         "address": {
//           "address_details": "",
//           "city": "Alex",
//           "district": "Al-Montazah"
//         },
//         "age": 16,
//         "gender": "female",
//         "main_photo":
//         "photos/1462453423756.jpg",
//         "person_name": "Mariam Ahmed"
//       },
//       "post_id": 10,
//       "user_id": 2,
//       "user_phone_number": "01198756127",
//       "user_photo":
//           "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       "username": "Mohamed Ali"
//     },
//     {
//       "date": "Sun, 15 May 2022 01:37:56 GMT",
//       "details": "",
//       "is_lost": true,
//       "is_owner": false,
//       "is_saved": false,
//       "person_data": {
//         "address": {"address_details": "", "city": "Giza", "district": "Maadi"},
//         "age": 12,
//         "gender": "female",
//         "main_photo":
//         "photos/1462453423756.jpg",
//         "person_name": "Hala Ahmed"
//       },
//       "post_id": 11,
//       "user_id": 3,
//       "user_phone_number": "01246932712",
//       "user_photo":
//           "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       "username": "Sara Adel"
//     },
//     {
//       "date": "Sun, 15 May 2022 01:39:06 GMT",
//       "details": "",
//       "is_lost": false,
//       "is_owner": false,
//       "is_saved": true,
//       "person_data": {
//         "address": {"address_details": "", "city": "Giza", "district": "Maadi"},
//         "age": 10,
//         "gender": "male",
//         "main_photo":
//             "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//         "person_name": "Hosam Hany"
//       },
//       "post_id": 12,
//       "user_id": 3,
//       "user_phone_number": "01246932712",
//       "user_photo":
//           "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       "username": "Sara Adel"
//     }
//   ],
//   "status": 200
// };
// final deletePostFakeResponse = {
//   "message": "تم حذف المنشور بنجاح",
//   "status": 200
// };
// final savePostFakeResponse = {
//   "message": "تم إضافة المنشور إلى منشوراتك المحفوظة",
//   "status": 200
// };
// final unSavePostFakeResponse = {
//   "message": "تم إزالة المنشور من منشوراتك المحفوظة",
//   "status": 200
// };
