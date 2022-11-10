import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:lost_app/app/common/data/local/pref/user_pref.dart';
import 'package:lost_app/shared/components/constant.dart';
import 'package:lost_app/shared/network/remote/puplish_multi_part.dart';

class ProfileWebService {
  UserPrefs userPrefs;
  // Dio dio = Dio();

  ProfileWebService(this.userPrefs);

  Future<Map<String, dynamic>> getProfileData(int startLimit) async {
    final String url = '${AppConst.baseUrl}profile?start=$startLimit&limit=10';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': userPrefs.getUserToken(),
    };
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;

    // // todo: fake data
    // final data = profileFakeResponse;
    // await Future.delayed(const Duration(seconds: 3));
    // // todo: end of fake data
    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> getSavedPosts(int startLimit) async {
    final String url =
        '${AppConst.baseUrl}get-saved-posts?start=$startLimit&limit=10';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': userPrefs.getUserToken(),
    };
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;

    // // todo: fake data
    // final data = savedFakeResponse;
    // await Future.delayed(const Duration(seconds: 3));
    // // todo: end of fake data
    log(data.toString());
    if (data['status'] == 200) {
      return data;
    } else {
      throw 'home server error';
    }
  }

  Future<Map<String, dynamic>> updateProfileData({
    required String userName,
    required String phoneNumber,
    required String email,
    required File photo,
  }) async {
    final String url = '${AppConst.baseUrl}update-profile';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': userPrefs.getUserToken(),
    };
    final body = {
      'username': userName,
      'phone_number': phoneNumber,
      'email': email,
      //'profile_photo': photo,
    };
    final fields = {'data': jsonEncode(body)};
    final files = <MultipartFile>[];
    files.add(await getPartFromFile('profile_photo', photo));
    final data = await postMultiPartRequest(
      url: url,
      fields: fields,
      files: files,
      headers: headers,
      method: 'PUT',
    );
    //
    // // todo: fake data
    // final data = updateFakeResponse;
    // await Future.delayed(const Duration(seconds: 3));
    // // todo: end of fake data
    log(data.toString());
    if (data['message'] == "تم تحديث ملفك الشخصي بنجاح") {
      return data;
    } else {
      throw 'home server error';
    }
  }
}

// final profileFakeResponse = {
//   "data": {
//     "email": "sara@gmail.com",
//     "phone_number": "01246932712",
//     "photo":
//         "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "posts": [
//       {
//         "date": "Sun, 15 May 2022 01:37:56 GMT",
//         "details": "",
//         "is_lost": true,
//         "is_owner": true,
//         "is_saved": false,
//         "person_data": {
//           "address": {
//             "address_details": "",
//             "city": "Giza",
//             "district": "Maadi"
//           },
//           "age": 12,
//           "gender": "female",
//           "main_photo":
//               "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//           "person_name": "Hala Ahmed"
//         },
//         "post_id": 10,
//         "user_id": 3,
//         "user_phone_number": "01246932712",
//         "user_photo":
//             "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//         "username": "Sara ALi"
//       },
//       // {
//       //   "date": "Sun, 15 May 2022 01:39:06 GMT",
//       //   "details": "",
//       //   "is_lost": false,
//       //   "is_owner": true,
//       //   "is_saved": false,
//       //   "person_data": {
//       //     "address": {
//       //       "address_details": "",
//       //       "city": "Giza",
//       //       "district": "Maadi"
//       //     },
//       //     "age": 10,
//       //     "gender": "male",
//       //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //     "person_name": "Hosam Hany"
//       //   },
//       //   "post_id": 12,
//       //   "user_id": 3,
//       //   "user_phone_number": "01246932712",
//       //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //   "username": "Sara ALi"
//       // },
//       // {
//       //   "date": "Sun, 15 May 2022 01:37:56 GMT",
//       //   "details": "",
//       //   "is_lost": true,
//       //   "is_owner": true,
//       //   "is_saved": false,
//       //   "person_data": {
//       //     "address": {
//       //       "address_details": "",
//       //       "city": "Giza",
//       //       "district": "Maadi"
//       //     },
//       //     "age": 12,
//       //     "gender": "female",
//       //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //     "person_name": "Hala Ahmed"
//       //   },
//       //   "post_id": 11,
//       //   "user_id": 3,
//       //   "user_phone_number": "01246932712",
//       //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //   "username": "Sara ALi"
//       // },
//       // {
//       //   "date": "Sun, 15 May 2022 01:39:06 GMT",
//       //   "details": "",
//       //   "is_lost": false,
//       //   "is_owner": true,
//       //   "is_saved": false,
//       //   "person_data": {
//       //     "address": {
//       //       "address_details": "",
//       //       "city": "Giza",
//       //       "district": "Maadi"
//       //     },
//       //     "age": 10,
//       //     "gender": "male",
//       //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //     "person_name": "Hosam Hany"
//       //   },
//       //   "post_id": 12,
//       //   "user_id": 3,
//       //   "user_phone_number": "01246932712",
//       //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //   "username": "Sara ALi"
//       // },
//       // {
//       //   "date": "Sun, 15 May 2022 01:37:56 GMT",
//       //   "details": "",
//       //   "is_lost": true,
//       //   "is_owner": true,
//       //   "is_saved": false,
//       //   "person_data": {
//       //     "address": {
//       //       "address_details": "",
//       //       "city": "Giza",
//       //       "district": "Maadi"
//       //     },
//       //     "age": 12,
//       //     "gender": "female",
//       //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //     "person_name": "Hala Ahmed"
//       //   },
//       //   "post_id": 11,
//       //   "user_id": 3,
//       //   "user_phone_number": "01246932712",
//       //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //   "username": "Sara ALi"
//       // },
//       // {
//       //   "date": "Sun, 15 May 2022 01:39:06 GMT",
//       //   "details": "",
//       //   "is_lost": false,
//       //   "is_owner": true,
//       //   "is_saved": false,
//       //   "person_data": {
//       //     "address": {
//       //       "address_details": "",
//       //       "city": "Giza",
//       //       "district": "Maadi"
//       //     },
//       //     "age": 10,
//       //     "gender": "male",
//       //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //     "person_name": "Hosam Hany"
//       //   },
//       //   "post_id": 12,
//       //   "user_id": 3,
//       //   "user_phone_number": "01246932712",
//       //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //   "username": "Sara ALi"
//       // },
//       // {
//       //   "date": "Sun, 15 May 2022 01:37:56 GMT",
//       //   "details": "",
//       //   "is_lost": true,
//       //   "is_owner": true,
//       //   "is_saved": false,
//       //   "person_data": {
//       //     "address": {
//       //       "address_details": "",
//       //       "city": "Giza",
//       //       "district": "Maadi"
//       //     },
//       //     "age": 12,
//       //     "gender": "female",
//       //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //     "person_name": "Hala Ahmed"
//       //   },
//       //   "post_id": 11,
//       //   "user_id": 3,
//       //   "user_phone_number": "01246932712",
//       //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //   "username": "Sara ALi"
//       // },
//       // {
//       //   "date": "Sun, 15 May 2022 01:39:06 GMT",
//       //   "details": "",
//       //   "is_lost": false,
//       //   "is_owner": true,
//       //   "is_saved": false,
//       //   "person_data": {
//       //     "address": {
//       //       "address_details": "",
//       //       "city": "Giza",
//       //       "district": "Maadi"
//       //     },
//       //     "age": 10,
//       //     "gender": "male",
//       //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //     "person_name": "Hosam Hany"
//       //   },
//       //   "post_id": 12,
//       //   "user_id": 3,
//       //   "user_phone_number": "01246932712",
//       //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //   "username": "Sara ALi"
//       // },
//       // {
//       //   "date": "Sun, 15 May 2022 01:37:56 GMT",
//       //   "details": "",
//       //   "is_lost": true,
//       //   "is_owner": true,
//       //   "is_saved": false,
//       //   "person_data": {
//       //     "address": {
//       //       "address_details": "",
//       //       "city": "Giza",
//       //       "district": "Maadi"
//       //     },
//       //     "age": 12,
//       //     "gender": "female",
//       //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //     "person_name": "Hala Ahmed"
//       //   },
//       //   "post_id": 11,
//       //   "user_id": 3,
//       //   "user_phone_number": "01246932712",
//       //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //   "username": "Sara ALi"
//       // },
//       // {
//       //   "date": "Sun, 15 May 2022 01:39:06 GMT",
//       //   "details": "",
//       //   "is_lost": false,
//       //   "is_owner": true,
//       //   "is_saved": false,
//       //   "person_data": {
//       //     "address": {
//       //       "address_details": "",
//       //       "city": "Giza",
//       //       "district": "Maadi"
//       //     },
//       //     "age": 10,
//       //     "gender": "male",
//       //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //     "person_name": "Hosam Hany"
//       //   },
//       //   "post_id": 12,
//       //   "user_id": 3,
//       //   "user_phone_number": "01246932712",
//       //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       //   "username": "Sara ALi"
//       // },
//     ],
//     "username": "Sara ALi"
//   },
//   "status": 200
// };
// final savedFakeResponse = {
//   "posts": [
//     {
//       "date": "Sat, 14 May 2022 22:45:45 GMT",
//       "details": "",
//       "is_lost": false,
//       "is_owner": false,
//       "is_saved": true,
//       "person_data": {
//         "address": {
//           "address_details": "",
//           "city": "Cairo ",
//           "district": "Zamalek"
//         },
//         "age": 8,
//         "gender": "male",
//         "main_photo":
//         "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//         "person_name": "fouad ali"
//       },
//       "post_id": 9,
//       "user_id": 1,
//       "user_phone_number": "01198752345",
//       "user_photo":
//       "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       "username": "Moamen Khaled"
//     },
//     {
//       "date": "Sat, 14 May 2022 22:48:28 GMT",
//       "details": "",
//       "is_lost": true,
//       "is_owner": false,
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
//         "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//         "person_name": "Mariam Ahmed"
//       },
//       "post_id": 10,
//       "user_id": 2,
//       "user_phone_number": "01198756127",
//       "user_photo":
//       "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       "username": "Mohamed Ali"
//     },
//     {
//       "date": "Sun, 15 May 2022 01:37:56 GMT",
//       "details": "",
//       "is_lost": true,
//       "is_owner": false,
//       "is_saved": true,
//       "person_data": {
//         "address": {"address_details": "", "city": "Giza", "district": "Maadi"},
//         "age": 12,
//         "gender": "female",
//         "main_photo":
//         "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//         "person_name": "Hala Ahmed"
//       },
//       "post_id": 11,
//       "user_id": 3,
//       "user_phone_number": "01246932712",
//       "user_photo":
//       "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
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
//         "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//         "person_name": "Hosam Hany"
//       },
//       "post_id": 12,
//       "user_id": 3,
//       "user_phone_number": "01246932712",
//       "user_photo":
//       "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//       "username": "Sara Adel"
//     }
//   ],
//   "status": 200
// };
// final updateFakeResponse = {
//   "message": "تم تحديث ملفك الشخصي بنجاح",
//   "status": 200
// };
