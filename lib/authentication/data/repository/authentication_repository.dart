import 'package:firebase_auth/firebase_auth.dart';
import 'package:lost_app/authentication/data/model/reset_password_model.dart';
import 'package:lost_app/authentication/data/model/user_data_model.dart';
import 'package:lost_app/authentication/data/web_services/authentication_web_service.dart';

class AuthenticationRepository {
  AuthenticationWebService registerWebService;

  AuthenticationRepository(this.registerWebService);

  Future? initialFirebaseService(
    Function(String? type)? callSignUpSuccess,
    String? type,
  ) async {
    return registerWebService.initFirebase(
      callSignUpSuccess: callSignUpSuccess,
      type: type,
    );
  }

  Future<void>? requestPhone({
    Function()? callSuccess,
    Function(FirebaseAuthException e)? callError,
    Function(String)? callSend,
    Function(String)? codeAutoRetrievalTimeout,
    String? type,
    String? mobile,
  }) async {
    return registerWebService.requestVerify(
      callSuccess: callSuccess,
      mobile: mobile,
      callSend: callSend,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      type: type,
      callError: callError,
    );
  }

  Future<void>? verifyOTP({
    Function(FirebaseAuthException e)? callError,
   required String smsCode,
   required String verificationIdSent,
  }) async {
    return registerWebService.verifyOtp(
      verificationId: verificationIdSent,
      callError: callError,
      smsCode: smsCode,
    );
  }

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
      email: email ?? '',
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

  Future<ResetPasswordModel> verifyPhoneNumber({
    required String phone,
  }) async {
    final data = await registerWebService.verifyPhoneNumber(
      phone: phone,
    );
    return ResetPasswordModel.fromJson(data);
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
