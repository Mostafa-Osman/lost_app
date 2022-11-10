import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

extension CubitExtensions on Cubit {
  Future<bool> get isConnectedToInternet async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> get isNoInternetConnection async =>
      !(await isConnectedToInternet);

  Future<bool> isNoInternetException(Object e) async =>
      await isNoInternetConnection ||
      e is SocketException ||
      e is ClientException;

  bool isServerSideException(Object e) => e is HandshakeException;

  Future<String> getErrorMessage(Object e) async {
    if (await isNoInternetException(e)) {
      await Future.delayed(const Duration(seconds: 1));
      return 'no_internet_connection';
    }
    return e.toString();
  }
}
