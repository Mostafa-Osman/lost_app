import 'dart:io';

import 'package:lost_app/data/models/home/home_model.dart';
import 'package:lost_app/post/data/web_services/create_post_web_services.dart';

class CreatePostRepository {
  CreatePostRepository(this.createPostWebServices);

  CreatePostWebServices createPostWebServices;
  Future<List<HomePost>> scanMainPhoto({
    required bool isLost,
    required File mainPhoto,
  }) async {
   final  data= await createPostWebServices.scanMainPhoto(
      isLost: isLost,
      mainPhoto: mainPhoto,
    );
    return (data['data'] as List)
        .map((e) => HomePost.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<HomePost> createPost({
    required String name,
    required int age,
    required String gender,
    required String governorate,
    required String city,
    String? addressDetails,
    required bool isLost,
    String? moreDetails,
     required File mainPhoto,
    required List<File> extraPhoto,
  }) async {


  return HomePost.fromJson(
      await createPostWebServices.createPost(
        name: name,
        age: age,
        gender: gender,
        governorate: governorate,
        city: city,
        addressDetails: addressDetails ?? '',
        isLost: isLost,
        moreDetails: moreDetails ?? '',
        mainPhoto: mainPhoto,
        extraPhoto: extraPhoto,
      ),);
    }
}
