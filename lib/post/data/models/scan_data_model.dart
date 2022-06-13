

import 'package:lost_app/presentations/home/data/Home_model/home_model.dart';

class ScanModel {
  final ScanData data;
  final String message;
  final int status;

  ScanModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      data: ScanData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as int,
    );
  }
}

class ScanData {
  final String phoneNumber;
  final List<HomePost> posts;

  ScanData({
    required this.phoneNumber,
    required this.posts,
  });

  factory ScanData.fromJson(Map<String, dynamic> json) {
    return ScanData(
      phoneNumber: json['phone_number'] as String,
      posts: (json['posts'] as List<dynamic>)
          .map((e) => HomePost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
//
// class Posts {
//   final String date;
//   final String details;
//   final bool isLost;
//   final bool isOwner;
//   final bool isSaved;
//   final PersonData personData;
//   final int postId;
//   final int userId;
//   final String userPhoneNumber;
//   final File userPhoto;
//   final String username;
//
//   Posts({
//     required this.date,
//     required this.details,
//     required this.isLost,
//     required this.isOwner,
//     required this.isSaved,
//     required this.personData,
//     required this.postId,
//     required this.userId,
//     required this.userPhoneNumber,
//     required this.userPhoto,
//     required this.username,
//   });
//
//   factory Posts.fromJson(Map<String, dynamic> json) {
//     return Posts(
//       date: json['date'] as String,
//       details: json['details'] as String,
//       isLost: json['is_lost'] as bool,
//       isOwner: json['is_owner'] as bool,
//       isSaved: json['is_saved'] as bool,
//       personData:
//           PersonData.fromJson(json['person_data'] as Map<String, dynamic>),
//       postId: json['post_id'] as int,
//       userId: json['user_id'] as int,
//       userPhoneNumber: json['user_phone_number'] as String,
//       userPhoto: json['user_photo'] as File,
//       username: json['username'] as String,
//     );
//   }
// }
//
// class PersonData {
//   final Address address;
//   final int age;
//   final String gender;
//   final File mainPhoto;
//   final String personName;
//
//   PersonData({
//     required this.address,
//     required this.age,
//     required this.gender,
//     required this.mainPhoto,
//     required this.personName,
//   });
//
//   factory PersonData.fromJson(Map<String, dynamic> json) {
//     return PersonData(
//       address: Address.fromJson(json['address'] as Map<String, dynamic>),
//       age: json['age'] as int,
//       gender: json['gender'] as String,
//       mainPhoto: json['main_photo'] as File,
//       personName: json['person_name'] as String,
//     );
//   }
// }
//
// class Address {
//   Address({
//     required this.addressDetails,
//     required this.city,
//     required this.district,
//   });
//
//   final String addressDetails;
//   final String city;
//   final String district;
//
//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       addressDetails: json['address_details'] as String,
//       city: json['city'] as String,
//       district: json['district'] as String,
//     );
//   }
// }
