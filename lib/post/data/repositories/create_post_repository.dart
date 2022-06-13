import 'dart:io';

import 'package:lost_app/post/data/models/create_post_dto.dart';
import 'package:lost_app/post/data/web_services/create_post_web_services.dart';
import 'package:lost_app/presentations/home/data/Home_model/home_model.dart';

class CreatePostRepository {
  CreatePostRepository(this.createPostWebServices);

  CreatePostWebServices createPostWebServices;

  Future<List<HomePost>> scanMainPhoto({
    required bool isLost,
    required File mainPhoto,
  }) async {
    final data = await createPostWebServices.scanMainPhoto(
      isLost: isLost,
      mainPhoto: mainPhoto,
    );
    return (data['data'] as List)
        .map((e) => HomePost.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<HomePost> createPost({
    required CreatePostDto createPostDto,
  }) async {
    return HomePost.fromJson(
      await createPostWebServices.createPost(
        createPostDto: createPostDto,
      ),
    );
  }
}
