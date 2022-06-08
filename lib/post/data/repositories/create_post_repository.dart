import 'dart:io';

import 'package:lost_app/post/data/web_services/create_post_web_services.dart';

class CreatePostRepository {
  CreatePostRepository(this.createPostWebServices);

  CreatePostWebServices createPostWebServices;

  Future<void> createPost({
    required String name,
    required int age,
    required String gender,
    required String governorate,
    required String city,
    String? addressDetails,
    required bool isLost,
    String? moreDetails,
     File? mainPhoto,
    required List<File> extraPhoto,
  }) async {
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
    );
  }
}
