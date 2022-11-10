class HomeModel {
  HomeModel({
    required this.posts,
    required this.status,
  });

  late final List<HomePost> posts;
  late final int status;

  HomeModel.fromJson(Map<String, dynamic> json) {
    posts = List.from(json['posts'] as List<dynamic>)
        .map((e) => HomePost.fromJson(e as Map<String, dynamic>))
        .toList();
    status = json['status'] as int;
  }
}

class HomePost {
  HomePost({
    required this.date,
    required this.details,
    required this.personData,
    required this.isLost,
    required this.isOwner,
    required this.isSaved,
    required this.userId,
    required this.userPhoto,
    required this.username,
    required this.userPhoneNumber,
  });

  late final String date;
  late final String details;
  late final PersonData? personData;
  late final dynamic isLost;
  late final bool isOwner;
  late bool isSaved;
  late final int userId;
  int? postId;
  late final String? userPhoto;
  late final String username;
  late final String userPhoneNumber;

  HomePost.fromJson(Map<String, dynamic> json) {
    date = json['date'] as String;
    details = json['details'] as String;
    personData =
        PersonData.fromJson(json['person_data'] as Map<String, dynamic>);
    isLost = json['is_lost'];
    isOwner = json['is_owner'] as bool;
    isSaved = json['is_saved'] as bool;
    userId = json['user_id'] as int;
    postId = json['post_id'] as int? ?? 0;
    userPhoto = json['user_photo'] as String?;
    username = json['username'] as String;
    userPhoneNumber = json['user_phone_number'] as String;
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

  PersonData.fromJson(Map<String, dynamic> json) {
    address = Address.fromJson(json['address'] as Map<String, dynamic>);
    age = json['age'] as int;
    gender = json['gender'] as String;
    mainPhoto = json['main_photo'] as String;
    personName = json['person_name'] as String;
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

  Address.fromJson(Map<String, dynamic> json) {
    addressDetails = json['address_details'] as String;
    city = json['city'] as String;
    district = json['district'] as String;
  }
}
