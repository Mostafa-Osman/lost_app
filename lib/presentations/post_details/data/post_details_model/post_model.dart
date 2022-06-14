class PostModel {
  PostModel({
    required this.post,
    required this.status,
  });
  late final Post post;
  late final int status;

  PostModel.fromJson(Map<String, dynamic> json){
    post =  Post.fromJson(json['post'] as Map<String, dynamic>);
    status = json['status'] as int;
  }
}

class Post {
  Post({
    required this.comments,
    required this.date,
    required this.details,
    required this.isLost,
    required this.isOwner,
    required this.isSaved,
    required this.personData,
    required this.postId,
    required this.userId,
    required this.userPhoneNumber,
     this.userPhoto,
    required this.username,
  });
  late List<Comments> comments;
  late final String date;
  late final String details;
  late final bool isLost;
  late final bool isOwner;
  late bool isSaved;
  late final PersonData personData;
  late final int postId;
  late final int userId;
  late final String userPhoneNumber;
  String? userPhoto;
  late final String username;

  Post.fromJson(Map<String, dynamic> json){
    comments = List.from(json['comments'] as Iterable<dynamic>).map((e)=>Comments.fromJson(e as Map<String, dynamic>)).toList();
    date = json['date'] as String;
    details = json['details'] as String;
    isLost = json['is_lost'] as bool;
    isOwner = json['is_owner'] as bool;
    isSaved = json['is_saved'] as bool;
    personData = PersonData.fromJson(json['person_data'] as Map<String, dynamic>);
    postId = json['post_id'] as int;
    userId = json['user_id'] as int;
    userPhoneNumber = json['user_phone_number'] as String;
    userPhoto = json['user_photo'] as String?;
    username = json['username']  as String;
  }

}

class Comments {
  Comments({
    required this.content,
    required this.commentId,
    required this.date,
    this.isOwner,
     this.photo,
    this.replies,
    required this.username,
  });
  late String content;
  late final int commentId;
  late final String date;
  bool? isOwner;
    String? photo;
  List<Replies>? replies;
  late final String username;

  Comments.fromJson(Map<String, dynamic> json){
    content = json['content'] as String;
    commentId = json['comment_id'] as int;
    date = json['date'] as String;
    isOwner = json['is_owner'] as bool? ?? true;
    photo = json['photo'] as String? ??'';
    replies = List.from(json['replies'] as Iterable<dynamic>? ??[]).map((e)=>Replies.fromJson(e as Map<String, dynamic>)).toList();
    username = json['username'] as String;
  }

}

class Replies {
  Replies({
    required this.content,
    required this.commentId,
    required this.date,
    required this.isOwner,
    required this.photo,
    required this.username,
  });
  late String content;
  late final int commentId;
  late final String date;
  bool? isOwner;
    String? photo;
  late final String username;

  Replies.fromJson(Map<String, dynamic> json){
    content = json['content'] as String;
    commentId = json['comment_id'] as int;
    date = json['date'] as String;
    isOwner = json['is_owner'] as bool? ?? true;
    photo = json['photo'] as String? ??'';
    username = json['username'] as String;
  }

}

class PersonData {
  PersonData({
    required this.address,
    required this.age,
    required this.extraPhotos,
    required this.gender,
    required this.mainPhoto,
    required this.personName,
  });
  late final Address address;
  late final int age;
  late final List<String> extraPhotos;
  late final String gender;
  late final String mainPhoto;
  late final String personName;

  PersonData.fromJson(Map<String, dynamic> json){
    address = Address.fromJson(json['address'] as Map<String, dynamic>);
    age = json['age'] as int;
    extraPhotos = List.from(json['extra_photos'] as List<dynamic>);
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

  Address.fromJson(Map<String, dynamic> json){
    addressDetails = json['address_details'] as String;
    city = json['city'] as String;
    district = json['district'] as String;
  }

}
