class HomeModel {
  HomeModel({
    required this.posts,
    required this.status,
  });
  late final List<Posts> posts;
  late final int status;

  HomeModel.fromJson(Map<String, dynamic> json){
    posts = List.from(json['Posts'] as List<dynamic>).map((e)=>Posts.fromJson(e as Map<String, dynamic>)).toList();
    status = json['status'] as int;
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['Posts'] = Posts.map((e )=>e.toJson()).toList();
  //   _data['status'] = status;
  //   return _data;
  // }
}

class Posts {
  Posts({
    required this.comments,
    required this.details,
    required this.foundPersonData,
    required this.isLost,
    required this.isOwner,
    required this.isSaved,
    required this.userId,
    required this.userPhoto,
    required this.username,
  });
  late final List<dynamic> comments;
  late final String details;
  late final FoundPersonData? foundPersonData;
  late final bool isLost;
  late final bool isOwner;
  late final bool? isSaved;
  late final int userId;
  late final String userPhoto;
  late final String username;

  Posts.fromJson(Map<String, dynamic> json){
    comments = List.castFrom<dynamic, dynamic>(json['Comments'] as List<dynamic>);
    details = json['details'] as String;
    foundPersonData = json['found_person_data'] as FoundPersonData;
    isLost = json['is_lost'] as bool;
    isOwner = json['is_owner'] as bool;
    isSaved = json['is_saved'] as bool;
    userId = json['user_id'] as int;
    userPhoto = json['user_photo'] as String;
    username = json['username'] as String;
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['Comments'] = comments;
  //   _data['details'] = details;
  //   _data['found_person_data'] = foundPersonData;
  //   _data['is_lost'] = isLost;
  //   _data['is_owner'] = isOwner;
  //   _data['is_saved'] = isSaved;
  //   _data['user_id'] = userId;
  //   _data['user_photo'] = userPhoto;
  //   _data['username'] = username;
  //   return _data;
  // }
}

class FoundPersonData {
  FoundPersonData({
    required this.address,
    required this.age,
    required this.extraPhotos,
    required this.gender,
    required this.mainPhoto,
    required this.personName,
  });
  late final Address address;
  late final int age;
  late final List<dynamic> extraPhotos;
  late final String gender;
  late final String mainPhoto;
  late final String personName;

  FoundPersonData.fromJson(Map<String, dynamic> json){
    address = Address.fromJson(json['address'] as Map<String, dynamic>);
    age = json['age'] as int;
    extraPhotos = List.castFrom<dynamic, dynamic>(json['extra_photos'] as List<dynamic>);
    gender = json['gender'] as String;
    mainPhoto = json['main_photo'] as String;
    personName = json['person_name'] as String;
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['address'] = address.toJson();
  //   _data['age'] = age;
  //   _data['extra_photos'] = extraPhotos;
  //   _data['gender'] = gender;
  //   _data['main_photo'] = mainPhoto;
  //   _data['person_name'] = personName;
  //   return _data;
  // }
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

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['address_details'] = addressDetails;
  //   _data['city'] = city;
  //   _data['district'] = district;
  //   return _data;
  // }
}
