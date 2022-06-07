import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:lost_app/shared/components/constant.dart';

class AuthenticationWebService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> initFirebase({
    Function(String? type)? callSignUpSuccess,
    String? type,
  }) async {
    //log out fromm all accounts before do any thing
    try {
      await auth.signOut();
      auth.authStateChanges().listen((firebaseUser) {
        if (firebaseUser == null) {
          log('User is currently signed out!');
        } else {
          // print("Firebase Auth changed.. $firebaseUser");
          log('User is signed in!, ${firebaseUser.phoneNumber}');
          //do function automatically
          callSignUpSuccess?.call(type);
        }
      });
    } catch (e, s) {
      log('initFirebase error', error: e, stackTrace: s);
    }
  }
  Future<void> requestVerify({
    String? mobile,
    String? type,
    Function()? callSuccess,
    Function(String )? callSend,
    Function(String )? codeAutoRetrievalTimeout,
    Function(FirebaseAuthException e)? callError,
  }) async {
    log('+2$mobile');
    try {
      log('we will send otp code to this number ${'+2${mobile!}'}');
      await auth.verifyPhoneNumber(
        phoneNumber: '+2$mobile',
        // ignore: prefer_const_constructors
        timeout: Duration(seconds: 60),
        verificationCompleted: (credential) async {
          log("Auth:Mobile verified automatically");
          callSuccess!.call();
        },
        verificationFailed: (FirebaseAuthException e) {
          log("Auth:verification failed");
          callError!.call(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          log("Auth:Verification code successfully sent");
          callSend!.call(verificationId);

          log('verificationId id $verificationId');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          codeAutoRetrievalTimeout!.call(verificationId);

          log("Auth:codeAutoRetrievalTimeout");
        },
      );
    } catch (e, s) {
      log("Auth:Send OTP Error ", error: e, stackTrace: s);
    }
  }
  Future<void> verifyOtp({
   required String verificationId,
   required String smsCode,
    Function(FirebaseAuthException e)? callError,
  }) async {
    try {
      log("Auth:Verify $verificationId");
      final PhoneAuthCredential phoneAuthCredential =
      PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(phoneAuthCredential);
    } on FirebaseAuthException catch (e, s) {
      log("Auth:OTP Error...Please check error", error: e, stackTrace: s);
      callError!.call(e);
    }
  }


  Future<Map<String, dynamic>> register({
    required String username,
    required String phone,
    required String password,
    String? email,
  }) async {
    //todo remove it after upload backend to server

    await Future.delayed(const Duration(seconds: 3));

    const String url = '${AppConst.baseUrl}register';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
    };

    final registerBody = {
      'username': username,
      'phone_number': phone,
      'email': email ?? '',
      'password': password,
      // 'confirm_password': password,
    };
    final response = await http.post(
      Uri.parse(url),
      body: const Utf8Encoder().convert(
        jsonEncode(registerBody),
      ),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    if (data['status'] == 200) {
      log(data.toString());
      return data;
    } else {
      throw data['message'].toString();
    }
  }

  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  }) async {
    log('phone: $phone');
    log('password : $password');

    //todo remove it after upload backend to server
    await Future.delayed(const Duration(seconds: 3));
    const String url = '${AppConst.baseUrl}login';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
    };

    final loginBody = {
      'phone_number': phone,
      'password': password,
    };
    final response = await http.post(
      Uri.parse(url),
      body: const Utf8Encoder().convert(
        jsonEncode(loginBody),
      ),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    if (data['status'] == 200) {
      log(data.toString());
      return data;
    } else {
      throw data['message'].toString();
    }
  }

  Future<Map<String, dynamic>> verifyPhoneNumber({
    required String phone,
  }) async {
    log('phone: $phone');

    //todo remove it after upload backend to server
    await Future.delayed(const Duration(seconds: 3));
    const String url = '${AppConst.baseUrl}forgot_password';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
    };

    final verifyPhoneNumber = {
      'phone_number': phone,
    };
    final response = await http.post(
      Uri.parse(url),
      body: const Utf8Encoder().convert(
        jsonEncode(verifyPhoneNumber),
      ),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    if (data['status'] == 200) {
      log(data.toString());
      return data;
    } else {
      throw 'error is verifyPhoneNumber AuthenticationWebService ';
    }
  }

  Future<Map<String, dynamic>> resetPassword({
    required String phone,
    required String password,
  }) async {
    log('phone: $phone');
    log('password : $password');

    //todo remove it after upload backend to server
    await Future.delayed(const Duration(seconds: 3));
    const String url = '${AppConst.baseUrl}reset_password';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
    };

    final resetPasswordBody = {
      'phone_number': phone,
      'password': password,
    };
    final response = await http.post(
      Uri.parse(url),
      body: const Utf8Encoder().convert(
        jsonEncode(resetPasswordBody),
      ),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    if (data['status'] == 200) {
      log(data.toString());
      return data;
    } else {
      throw data['message'].toString();
    }
  }
}
