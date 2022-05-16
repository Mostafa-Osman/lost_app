import 'dart:developer';

import 'package:lost_app/shared/components/constant.dart';
import 'package:lost_app/shared/network/remote/dio_helper.dart';

class HomeWebService{

  Future<void/*Map<String, dynamic>*/> home() async {
    final response = await DioHelper.postData(url: AppConst.baseUrl);
    final data = response?.data as Map<String, dynamic>;
    log(data.toString());
    if (data['status'] == true) {
      //return data ;
    } else {
      //throw data['message'];
    }
  }
}