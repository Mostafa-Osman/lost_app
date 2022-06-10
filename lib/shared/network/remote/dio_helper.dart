import 'package:dio/dio.dart';

// ignore: avoid_classes_with_only_static_members
class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response?>? getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'authorization': token ?? '',
    };
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response?>? postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'authorization': token ?? '',
    };

    return dio?.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response?>? deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'authorization': token ?? '',
    };

    return dio?.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }static Future<Response?>? putData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'authorization': token ?? '',
    };

    return dio?.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
