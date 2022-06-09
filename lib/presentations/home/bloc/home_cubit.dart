// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/data/models/home/home_model.dart';
import 'package:lost_app/data/models/home/post_model.dart';
import 'package:lost_app/data/repositories/home/home_repistory.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  late List<HomePost> homePosts = [];
  Post? post;
  late Comments comment;
  HomeRepository homeRepository;
  int startLimit = 0;
  final refreshController = RefreshController();
  int sliderCurrentImgIndex = 0;
  PageController sliderController = PageController();

  void onSliderImageChange(int index) {
    sliderCurrentImgIndex = index;
    emit(HomeSuccessState());
  }

  Future<void> getHomeData() async {
    try {
      homePosts.addAll(await homeRepository.getHomePosts(startLimit));;
      log('start limit = $startLimit');
      emit(HomeSuccessState());
    } catch (e, s) {
      log('error in getHomeData', error: e, stackTrace: s);
      emit(HomeErrorState(e.toString()));
    }
  }
  Future<void> onLoading() async {
    startLimit = homePosts.length;
    await getHomeData();
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    emit(HomeLoadingState());
    startLimit = 0;
    await getHomeData();
    refreshController.refreshCompleted();
  }

  Future<void> getPostData(int postId) async {
    emit(HomeLoadingState());
    try {
      post = await homeRepository.getPostData(postId);
      emit(HomeSuccessState());
    } catch (e, s) {
      log('error in getPostData', error: e, stackTrace: s);
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> deletePost({required int postId, required int postIndex}) async {
    emit(HomeLoadingState());
    try {
      await homeRepository.deletePost(postId);
      homePosts.removeAt(postIndex);
      emit(HomeDeletePostSuccessState());
    } catch (e, s) {
      log('error in deletePost', error: e, stackTrace: s);
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> deleteComment({
    required int postId,
    required int commentId,
    required int commentIndex,
    required int parentCommentId,
    required int parentCommentIndex,
  }) async {
    emit(HomeLoadingState());
    try {
      await homeRepository.deleteComment(
        postId: postId,
        commentId: commentId,
        parentCommentId: parentCommentId,
      );

      if (parentCommentIndex == -1) {
        post!.comments.removeAt(commentIndex);
      } else {
        post!.comments[parentCommentIndex].replies!.removeAt(commentIndex);
      }
      log(parentCommentIndex.toString());
      log(commentIndex.toString());
      log(post!.comments.length.toString());
      log(post!.comments[commentIndex].replies!.length.toString());
      emit(HomeDeleteCommentSuccessState());
    } catch (e, s) {
      log('error in deleteComment', error: e, stackTrace: s);
      emit(HomeErrorState(e.toString()));
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
      HomeEmitEditCommentDialogState(
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
      await homeRepository.updateComment(
        postId: postId,
        commentId: commentId,
        parentCommentId: parentCommentId,
        content: comment,
      );
      log(post!.comments.length.toString());
      if (parentCommentIndex == -1) {
        post!.comments[commentIndex].content = comment;
      } else {
        post!.comments[parentCommentIndex].replies![commentIndex].content =
            comment;
      }
      log(post!.comments.length.toString());
      emit(HomeUpdateCommentSuccessState());
    } catch (e, s) {
      log('error in updateComment', error: e, stackTrace: s);
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> createComment({
    required int postId,
    required int parentCommentId,
    required String content,
  }) async {
    emit(PostCommentLoadingState());
    try {
      comment = await homeRepository.createComment(
        postId: postId,
        parentCommentId: parentCommentId,
        content: content,
      );
      comment.isOwner = true;
      post!.comments.add(comment);
      log(comment.toString());
      emit(HomeSuccessState());
    } catch (e, s) {
      log('error in createComment', error: e, stackTrace: s);
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> isSavedPost({
    required int postId,
    required int postIndex,
  }) async {
    homePosts[postIndex].isSaved = !homePosts[postIndex].isSaved;
    if (post != null) {
      if (postId == post!.postId) {
        post!.isSaved = !post!.isSaved;
      }
    }
    emit(HomeSuccessState());
    if (!homePosts[postIndex].isSaved) {
      try {
        await homeRepository.unSavePost(postId);
        emit(HomeSuccessState());
      } catch (e, s) {
        log('error in isSavedPost true', error: e, stackTrace: s);
        emit(HomeErrorState(e.toString()));
      }
    } else {
      try {
        await homeRepository.savePost(postId);
        emit(HomeSuccessState());
      } catch (e, s) {
        log('error in isSavedPost false', error: e, stackTrace: s);
        emit(HomeErrorState(e.toString()));
      }
    }
  }
}
