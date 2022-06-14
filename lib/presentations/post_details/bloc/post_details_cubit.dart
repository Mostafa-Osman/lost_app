import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/post_details/data/post_details_model/post_model.dart';
import 'package:lost_app/presentations/post_details/data/post_details_repository/post_details_repository.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit(this.postDetailsRepository) : super(PostDetailsInitial());
  PostDetailsRepository postDetailsRepository;
  bool pop = false;
  Post? post;
  late Comments comment;
  late Replies replyComment;
  int sliderCurrentImgIndex = 0;
  PageController sliderController = PageController();


  // Future<void> emitLoading() async {
  //   emit(PostDetailsLoadingState());
  // }

  void emitNavigatorPop({required bool pop}) {
    log(pop.toString());
    if(pop) {
      emit(PostDetailsDeletePostSuccessState());
    }
  }

  void onSliderImageChange(int index) {
    sliderCurrentImgIndex = index;
    emit(PostDetailsSuccessState());
  }

  Future<void> getPostData(int postId) async {
    emit(PostDetailsLoadingState());
    try {
      post = await postDetailsRepository.getPostData(postId);
      emit(PostDetailsSuccessState());
    } catch (e, s) {
      log('error in getPostData', error: e, stackTrace: s);
      emit(PostDetailsErrorState(e.toString()));
    }
  }

  Future<void> deleteComment({
    required int postId,
    required int commentId,
    required int commentIndex,
    required int parentCommentId,
    required int parentCommentIndex,
  }) async {
    emit(PostDetailsLoadingState());
    try {
      await postDetailsRepository.deleteComment(
        postId: postId,
        commentId: commentId,
        parentCommentId: parentCommentId,
      );

      if (parentCommentIndex == -1) {
        post!.comments.removeAt(commentIndex);
        emit(PostDetailsDeleteCommentSuccessState());

      } else {
        post!.comments[parentCommentIndex].replies!.removeAt(commentIndex);
        emit(PostDetailsSuccessState());
      }
      log(parentCommentIndex.toString());
      log(commentIndex.toString());
      log(post!.comments.length.toString());
      log(post!.comments[commentIndex].replies!.length.toString());
    } catch (e, s) {
      log('error in deleteComment', error: e, stackTrace: s);
      emit(PostDetailsErrorState(e.toString()));
    }
  }

  void emitEditComment({
    required String comment,
    required int postId,
    required int commentId,
    required int commentIndex,
    required int parentCommentId,
    required int parentCommentIndex,
  }) {
    emit(
      PostDetailsEmitEditCommentDialogState(
        comment: comment,
        postId: postId,
        commentId: commentId,
        commentIndex: commentIndex,
        parentCommentId: parentCommentId,
        parentCommentIndex: parentCommentIndex,
      ),
    );
  }

  Future<void> updateComment({
    required String comment,
    required int postId,
    required int commentId,
    required int commentIndex,
    required int parentCommentId,
    required int parentCommentIndex,
  }) async {
    try {
      await postDetailsRepository.updateComment(
        postId: postId,
        commentId: commentId,
        parentCommentId: parentCommentId,
        content: comment,
      );
      log(parentCommentIndex.toString());
      log(post!.comments.length.toString());
      if (parentCommentIndex == -1) {
        post!.comments[commentIndex].content = comment;
      } else {
        post!.comments[parentCommentIndex].replies![commentIndex].content =
            comment;
      }
      emit(PostDetailsUpdateCommentSuccessState());
    } catch (e, s) {
      log('error in updateComment', error: e, stackTrace: s);
      emit(PostDetailsErrorState(e.toString()));
    }
  }

  Future<void> createComment({
    required int postId,
    required int parentCommentId,
    bool reply = false,
    int parentCommentIndex = -1,
    required String content,
  }) async {
    emit(PostCommentLoadingState());
    try {
      if(!reply) {
        comment = await postDetailsRepository.createComment(
          reply: reply,
          postId: postId,
          parentCommentId: parentCommentId,
          content: content,
        ) as Comments;
        comment.isOwner = true;
        post!.comments.add(comment);
      }else {
        replyComment = await postDetailsRepository.createComment(
          reply: reply,
          postId: postId,
          parentCommentId: parentCommentId,
          content: content,
        ) as Replies;
        //todo check mansour
        // comment.isOwner = true;
        post!.comments[parentCommentIndex].replies?.add(replyComment);
      }
      // log(comment.toString());
      emit(PostDetailsSuccessState());
    } catch (e, s) {
      log('error in createComment', error: e, stackTrace: s);
      emit(PostDetailsErrorState(e.toString()));
    }
  }
  void emitDeletePost(){
    emit(PostDetailsDeletePostSuccessState());
  }

  Future<void> isSavedPost({
    required int postId,
    required int postIndex,
  }) async {
    if (post != null) {
      if (postId == post!.postId) {
        post!.isSaved = !post!.isSaved;
      }
    }
    emit(PostDetailsSuccessState());
  }

}
