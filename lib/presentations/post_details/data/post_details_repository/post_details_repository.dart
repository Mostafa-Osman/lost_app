import 'package:lost_app/presentations/post_details/data/post_details_model/post_model.dart';
import 'package:lost_app/presentations/post_details/data/post_details_web_service/post_details_web_service.dart';

class PostDetailsRepository{
  PostDetailsWebService postDetailsWebService;
  PostDetailsRepository(this.postDetailsWebService);

  Future<Post> getPostData(int postId) async {
    final data = await postDetailsWebService.getPostData(postId);
    return Post.fromJson(data['post'] as Map<String, dynamic>);
  }

  Future<String> deleteComment({
    required int postId,
    required int commentId,
    required int parentCommentId,
  }) async {
    final data = await postDetailsWebService.deleteComment(
      postId: postId,
      parentCommentId: parentCommentId,
      commentId: commentId,
    );
    return data['message'] as String;
  }

  Future createComment({
    required bool reply,
    required int postId,
    required int parentCommentId,
    required String content,
  }) async {
    final data = await postDetailsWebService.createComment(
      postId: postId,
      parentCommentId: parentCommentId,
      content: content,
    );
    if(!reply){
      return Comments.fromJson(data['data'] as Map<String, dynamic>);
    }else {
      return Replies.fromJson(data['data'] as Map<String, dynamic>);
    }

  }

  Future<Comments> updateComment({
    required int postId,
    required int commentId,
    required int parentCommentId,
    required String content,
  }) async {
    final data = await postDetailsWebService.updateComment(
      postId: postId,
      commentId: commentId,
      parentCommentId: parentCommentId,
      content: content,
    );
    return Comments.fromJson(data['data'] as Map<String, dynamic>);
  }
}
