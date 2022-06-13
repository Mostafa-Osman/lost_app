import 'package:lost_app/presentations/home/data/Home_model/home_model.dart';

class ProfileModel {
  ProfileModel({
    required this.email,
    required this.phoneNumber,
    required this.photo,
    required this.posts,
    required this.username,
  });

  String? email;
  String? phoneNumber;
  String? photo;
  late final List<HomePost> posts;
  String? username;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['email'] as String;
    phoneNumber = json['phone_number'] as String;
    photo = json['photo'] as String;
    posts = List.from(json['posts'] as List<dynamic>)
        .map((e) => HomePost.fromJson(e as Map<String, dynamic>))
        .toList();
    username = json['username'] as String;
  }
}

/*
class Posts {
  Posts({
    required this.date,
    required this.details,
    required this.isLost,
    required this.isOwner,
    required this.isSaved,
    required this.personData,
    required this.postId,
    required this.userId,
    required this.userPhoneNumber,
    required this.userPhoto,
    required this.username,
  });
  late final String date;
  late final String details;
  late final bool isLost;
  late final bool isOwner;
  late final bool isSaved;
  late final PersonData personData;
  late final int postId;
  late final int userId;
  late final String userPhoneNumber;
  late final String userPhoto;
  late final String username;

  Posts.fromJson(Map<String, dynamic> json){
    date = json['date'] as String;
    details = json['details'] as String;
    isLost = json['is_lost'] as bool;
    isOwner = json['is_owner'] as bool;
    isSaved = json['is_saved'] as bool;
    personData = PersonData.fromJson(json['person_data'] as Map<String, dynamic>);
    postId = json['post_id'] as int;
    userId = json['user_id'] as int;
    userPhoneNumber = json['user_phone_number'] as String;
    userPhoto = json['user_photo'] as String;
    username = json['username'] as String;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['details'] = details;
    _data['is_lost'] = isLost;
    _data['is_owner'] = isOwner;
    _data['is_saved'] = isSaved;
    _data['person_data'] = personData.toJson();
    _data['post_id'] = postId;
    _data['user_id'] = userId;
    _data['user_phone_number'] = userPhoneNumber;
    _data['user_photo'] = userPhoto;
    _data['username'] = username;
    return _data;
  }
}

class PersonData {
  PersonData({
    required this.address,
    required this.age,
    required this.gender,
    required this.mainPhoto,
    required this.personName,
  });
  late final Address address;
  late final int age;
  late final String gender;
  late final String mainPhoto;
  late final String personName;

  PersonData.fromJson(Map<String, dynamic> json){
    address = Address.fromJson(json['address'] as Map<String, dynamic>);
    age = json['age'] as int;
    gender = json['gender'] as String;
    mainPhoto = json['main_photo'] as String;
    personName = json['person_name'] as String;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address.toJson();
    _data['age'] = age;
    _data['gender'] = gender;
    _data['main_photo'] = mainPhoto;
    _data['person_name'] = personName;
    return _data;
  }
}

class Address {
  Address({
    required this.addressDetails,
    required this.city,
    required this.district,
  });
  late final String addressDetails;
  late final String city;
  late final String district;

  Address.fromJson(Map<String, dynamic> json){
    addressDetails = json['address_details'] as String;
    city = json['city'] as String;
    district = json['district'] as String;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address_details'] = addressDetails;
    _data['city'] = city;
    _data['district'] = district;
    return _data;
  }
}
*/
