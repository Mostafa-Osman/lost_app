
import 'package:lost_app/authentication/data/model/register_model.dart';
import 'package:lost_app/authentication/data/repository/authentication_web_service.dart';

class AuthenticationRepository {
  AuthenticationWebService registerWebService;

  AuthenticationRepository(this.registerWebService);

  Future<UserData> register({
    required String username,
    required String phone,
    required String password,
    required String email,
  }) async {
    final data = await registerWebService.register(
      username: username,
      phone: phone,
      password: password,
      email: email,
    );

    return UserData.fromJson(data['data'] as Map<String,dynamic>);
  }
  Future<UserData> login({
    required String phone,
    required String password,
  }) async {
    final data = await registerWebService.login(
      phone: phone,
      password: password,
    );

    return UserData.fromJson(data['data'] as Map<String,dynamic>);
  }
}
