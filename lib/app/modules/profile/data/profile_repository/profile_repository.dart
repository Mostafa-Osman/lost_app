import 'dart:io';

import 'package:lost_app/app/modules/home/data/Home_model/home_model.dart';
import 'package:lost_app/app/modules/profile/data/profile_model/profile_model.dart';
import 'package:lost_app/app/modules/profile/data/profile_web_service/profile_web_service.dart';


class ProfileRepository {
  ProfileWebService profileWebService;
  ProfileRepository(this.profileWebService);

  Future<ProfileModel> getProfileData(int startLimit) async {
    final data = await profileWebService.getProfileData(startLimit);
    return ProfileModel.fromJson(data['data'] as Map<String, dynamic>);
  }
  Future<List<HomePost>> getSavedPosts(int startLimit) async {
    final data = await profileWebService.getSavedPosts(startLimit);
    return (data['posts'] as List)
        .map((e) => HomePost.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<String> updateProfile({
    required String userName,
    required String phoneNumber,
    required String email,
    required File photo,
  }) async {
    final data = await profileWebService.updateProfileData(
      userName: userName,
      phoneNumber: phoneNumber,
      email: email,
      photo: photo,
    );
    return data["message"] as String;
  }
}
