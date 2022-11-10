// import 'dart:convert';
//
// import 'package:http/http.dart';
//
// class CitiesWebservice {
//   Future<Map<String, dynamic>> getGovernorates() async {
//     const url = '${AppStrings.baseUrl}governorates';
//     final headers = {'Content-language': gt<LangPrefs>().lang};
//     final response = await get(Uri.parse(url), headers: headers);
//     final data = jsonDecode(response.body) as Map<String, dynamic>;
//     if (data['statusCode'] != 200) throw getResponseErrorMessage(data);
//     return data['data'] as Map<String, dynamic>;
//   }
// }
