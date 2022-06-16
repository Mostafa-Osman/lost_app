import 'dart:io';

class CreatePostDto {
  String name;
  int age;
  String gender;
  String governorate;
  String city;
  String? addressDetails;
  bool isLost;
  String? moreDetails;
  File mainPhoto;
  List<File> extraPhoto;
  bool isTemp;

  CreatePostDto({
    required this.name,
    required this.age,
    required this.gender,
    required this.governorate,
    required this.city,
    this.addressDetails,
    required this.isLost,
    this.moreDetails,
    required this.mainPhoto,
    required this.extraPhoto,
    this.isTemp=false,
  });

  // create copy with
  factory CreatePostDto.copyWith({
    required String name,
    required int age,
    required String gender,
    required String governorate,
    required String city,
    String? addressDetails = '',
    required bool isLost,
    String? moreDetails = '',
    required File mainPhoto,
    required List<File> extraPhoto,
    bool? isTemp,
  }) {
    return CreatePostDto(
      name: name,
      age: age,
      gender: gender,
      governorate: governorate,
      city: city,
      addressDetails: addressDetails ?? '',
      isLost: isLost,
      moreDetails: moreDetails ?? '',
      mainPhoto: mainPhoto,
      extraPhoto: extraPhoto,
      isTemp: isTemp?? false,
    );
  }
  Map<String, String> toMap() {
    final map = <String, String>{
      'name': name,
      'age': age.toString(),
      'gender': gender,
      'city': governorate,
      'district': city,
      'address_details': moreDetails ?? '',
      'is_lost': isLost.toString(),
      'more_details': moreDetails ?? '',
      'isTemp':isTemp.toString(),
    };
    return map;
  }
}
