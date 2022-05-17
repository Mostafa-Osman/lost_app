import 'package:lost_app/data/models/home/home_model.dart';
import 'package:lost_app/data/models/home/post_model.dart';
import 'package:lost_app/data/web_services/home_web_service.dart';

class HomeRepository {
  HomeWebService homeWebService;
  HomeRepository(this.homeWebService);

  Future<List<HomePost>> getHomePosts(int startLimit) async {
    final data = await homeWebService.getHomePosts(startLimit);
    return (data['posts'] as List)
        .map((e) => HomePost.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Post> getPostData(int postId) async {
    final data = await homeWebService.getPostData(postId);
    return Post.fromJson(data['post'] as Map<String, dynamic>);
  }

  Future<String> deletePost(int postId) async {
    final data = await homeWebService.deletePost(postId);
    return data['message'] as String;
  }

  Future<String> savePost(int postId) async {
    final data = await homeWebService.savePost(postId);
    return data['message'] as String;
  }

  Future<String> unSavePost(int postId) async {
    final data = await homeWebService.unSavePost(postId);
    return data['message'] as String;
  }
}
