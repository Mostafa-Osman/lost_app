
import 'package:lost_app/authentication/data/model/register_model.dart';
import 'package:lost_app/authentication/data/repository/authentcation_web_service.dart';

class RegisterRepository {
  RegisterWebService registerWebService;

  RegisterRepository(this.registerWebService);

  Future<RegisterData> register({
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

    return RegisterData.fromJson(data['data'] as Map<String,dynamic>);
  }
}
