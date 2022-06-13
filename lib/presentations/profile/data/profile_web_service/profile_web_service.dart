import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';

class ProfileWebService {
  UserPrefs userPrefs;
  Dio dio = Dio();

  ProfileWebService(this.userPrefs);

  Future<Map<String, dynamic>> getProfileData(int startLimit) async {
    // final response = await dio.get(
    //   '${AppConst.baseUrl}profile?start=$startLimit&limit=10',
    //   options: Options(
    //     headers: {
    //       'Content-Type': 'application/json;charset=UTF-8',
    //       'Authorization': userPrefs.getUserToken(),
    //     },
    //   ),
    // );
    // final data = response.data as Map<String, dynamic>;

    // todo: fake data
    final data = profileFakeResponse;
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

final profileFakeResponse = {
  "data": {
    "email": "sara@gmail.com",
    "phone_number": "01246932712",
    "photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "posts": [
      {
        "date": "Sun, 15 May 2022 01:37:56 GMT",
        "details": "",
        "is_lost": true,
        "is_owner": true,
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
        "post_id": 10,
        "user_id": 3,
        "user_phone_number": "01246932712",
        "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "username": "Sara ALi"
      },
      // {
      //   "date": "Sun, 15 May 2022 01:39:06 GMT",
      //   "details": "",
      //   "is_lost": false,
      //   "is_owner": true,
      //   "is_saved": false,
      //   "person_data": {
      //     "address": {
      //       "address_details": "",
      //       "city": "Giza",
      //       "district": "Maadi"
      //     },
      //     "age": 10,
      //     "gender": "male",
      //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //     "person_name": "Hosam Hany"
      //   },
      //   "post_id": 12,
      //   "user_id": 3,
      //   "user_phone_number": "01246932712",
      //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //   "username": "Sara ALi"
      // },
      // {
      //   "date": "Sun, 15 May 2022 01:37:56 GMT",
      //   "details": "",
      //   "is_lost": true,
      //   "is_owner": true,
      //   "is_saved": false,
      //   "person_data": {
      //     "address": {
      //       "address_details": "",
      //       "city": "Giza",
      //       "district": "Maadi"
      //     },
      //     "age": 12,
      //     "gender": "female",
      //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //     "person_name": "Hala Ahmed"
      //   },
      //   "post_id": 11,
      //   "user_id": 3,
      //   "user_phone_number": "01246932712",
      //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //   "username": "Sara ALi"
      // },
      // {
      //   "date": "Sun, 15 May 2022 01:39:06 GMT",
      //   "details": "",
      //   "is_lost": false,
      //   "is_owner": true,
      //   "is_saved": false,
      //   "person_data": {
      //     "address": {
      //       "address_details": "",
      //       "city": "Giza",
      //       "district": "Maadi"
      //     },
      //     "age": 10,
      //     "gender": "male",
      //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //     "person_name": "Hosam Hany"
      //   },
      //   "post_id": 12,
      //   "user_id": 3,
      //   "user_phone_number": "01246932712",
      //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //   "username": "Sara ALi"
      // },
      // {
      //   "date": "Sun, 15 May 2022 01:37:56 GMT",
      //   "details": "",
      //   "is_lost": true,
      //   "is_owner": true,
      //   "is_saved": false,
      //   "person_data": {
      //     "address": {
      //       "address_details": "",
      //       "city": "Giza",
      //       "district": "Maadi"
      //     },
      //     "age": 12,
      //     "gender": "female",
      //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //     "person_name": "Hala Ahmed"
      //   },
      //   "post_id": 11,
      //   "user_id": 3,
      //   "user_phone_number": "01246932712",
      //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //   "username": "Sara ALi"
      // },
      // {
      //   "date": "Sun, 15 May 2022 01:39:06 GMT",
      //   "details": "",
      //   "is_lost": false,
      //   "is_owner": true,
      //   "is_saved": false,
      //   "person_data": {
      //     "address": {
      //       "address_details": "",
      //       "city": "Giza",
      //       "district": "Maadi"
      //     },
      //     "age": 10,
      //     "gender": "male",
      //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //     "person_name": "Hosam Hany"
      //   },
      //   "post_id": 12,
      //   "user_id": 3,
      //   "user_phone_number": "01246932712",
      //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //   "username": "Sara ALi"
      // },
      // {
      //   "date": "Sun, 15 May 2022 01:37:56 GMT",
      //   "details": "",
      //   "is_lost": true,
      //   "is_owner": true,
      //   "is_saved": false,
      //   "person_data": {
      //     "address": {
      //       "address_details": "",
      //       "city": "Giza",
      //       "district": "Maadi"
      //     },
      //     "age": 12,
      //     "gender": "female",
      //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //     "person_name": "Hala Ahmed"
      //   },
      //   "post_id": 11,
      //   "user_id": 3,
      //   "user_phone_number": "01246932712",
      //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //   "username": "Sara ALi"
      // },
      // {
      //   "date": "Sun, 15 May 2022 01:39:06 GMT",
      //   "details": "",
      //   "is_lost": false,
      //   "is_owner": true,
      //   "is_saved": false,
      //   "person_data": {
      //     "address": {
      //       "address_details": "",
      //       "city": "Giza",
      //       "district": "Maadi"
      //     },
      //     "age": 10,
      //     "gender": "male",
      //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //     "person_name": "Hosam Hany"
      //   },
      //   "post_id": 12,
      //   "user_id": 3,
      //   "user_phone_number": "01246932712",
      //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //   "username": "Sara ALi"
      // },
      // {
      //   "date": "Sun, 15 May 2022 01:37:56 GMT",
      //   "details": "",
      //   "is_lost": true,
      //   "is_owner": true,
      //   "is_saved": false,
      //   "person_data": {
      //     "address": {
      //       "address_details": "",
      //       "city": "Giza",
      //       "district": "Maadi"
      //     },
      //     "age": 12,
      //     "gender": "female",
      //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //     "person_name": "Hala Ahmed"
      //   },
      //   "post_id": 11,
      //   "user_id": 3,
      //   "user_phone_number": "01246932712",
      //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //   "username": "Sara ALi"
      // },
      // {
      //   "date": "Sun, 15 May 2022 01:39:06 GMT",
      //   "details": "",
      //   "is_lost": false,
      //   "is_owner": true,
      //   "is_saved": false,
      //   "person_data": {
      //     "address": {
      //       "address_details": "",
      //       "city": "Giza",
      //       "district": "Maadi"
      //     },
      //     "age": 10,
      //     "gender": "male",
      //     "main_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //     "person_name": "Hosam Hany"
      //   },
      //   "post_id": 12,
      //   "user_id": 3,
      //   "user_phone_number": "01246932712",
      //   "user_photo": "https://images.pexels.com/photos/10366332/pexels-photo-10366332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //   "username": "Sara ALi"
      // },
    ],
    "username": "Sara ALi"
  },
  "status": 200
};
