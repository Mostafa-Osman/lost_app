// class PersonData {
//   final Address address;
//   final int age;
//
//   // final List<dynamic> extraPhotos;
//   final String gender;
//   final String mainPhoto;
//   final String name;
//   final bool isLost;
//   final String moreDetails;
//
//   PersonData({
//     required this.address,
//     required this.age,
//     // required this.extraPhotos,
//     required this.gender,
//     required this.mainPhoto,
//     required this.name,
//     required this.isLost,
//     required this.moreDetails,
//   });
//
//   factory PersonData.fromJson(Map<String, dynamic> json) {
//     return PersonData(
//       address: Address.fromJson(json['address'] as Map<String, dynamic>),
//       age: json['age'] as int,
//       // extraPhotos:
//       //     List.castFrom<dynamic, dynamic>(json['extra_photos']),
//       gender: json['gender'] as String,
//       mainPhoto: json['mainPhoto'] as String,
//       name: json['name'] as String,
//       isLost: json['isLost'] as bool,
//       moreDetails: json['moreDetails'] as String,
//     );
//   }
// }
//
// class Address {
//   final String addressDetails;
//   final String city;
//   final String governorate;
//
//   Address({
//     required this.addressDetails,
//     required this.city,
//     required this.governorate,
//   });
//
//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       addressDetails: json['addressDetails'] as String,
//       governorate: json['city'] as String,
//       city: json['district'] as String,
//     );
//   }
// }
