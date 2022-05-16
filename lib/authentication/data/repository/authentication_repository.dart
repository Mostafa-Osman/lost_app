import 'package:lost_app/authentication/data/model/user_data_model.dart';
import 'package:lost_app/authentication/data/repository/authentication_web_service.dart';

class AuthenticationRepository {
  AuthenticationWebService registerWebService;

  AuthenticationRepository(this.registerWebService);

  Future<UserData> register({
    required String username,
    required String phone,
    required String password,
     String? email,
  }) async {
    final data = await registerWebService.register(
      username: username,
      phone: phone,
      password: password,
      email: email??'',
    );

    return UserData.fromJson(data['data'] as Map<String, dynamic>);
  }

  Future<UserData> login({
    required String phone,
    required String password,
  }) async {
    final data = await registerWebService.login(
      phone: phone,
      password: password,
    );

    return UserData.fromJson(data['data'] as Map<String, dynamic>);
  }

  Future<bool> verifyPhoneNumber({
    required String phone,
  }) async {
    final data = await registerWebService.verifyPhoneNumber(
      phone: phone,
    );
    return data['Is Registered?'] as bool;
  }

  Future<String> resetPassword({
    required String phone,
    required String password,
  }) async {
    final data = await registerWebService.resetPassword(
      phone: phone,
      password: password,
    );
    return data['message'] as String;
  }
}
