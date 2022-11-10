// import 'package:lost_app/app/common/data/remote/cities/cities_model.dart';
// import 'package:lost_app/app/common/data/remote/cities/cities_webservice.dart';
// import 'package:lost_app/app/services/locator_service.dart';
//
// class CitiesRepo {
//   final webservice = gt<CitiesWebservice>();
//
//   Future<List<Governorate>> getGovernorates() async {
//     final data = await webservice.getGovernorates();
//     return (data['governorates'] as List)
//         .map((e) => Governorate.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }
// }//