// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:lost_app/data/models/home/home_model.dart';
import 'package:lost_app/data/models/home/post_model.dart';
import 'package:lost_app/data/repositories/home/home_repistory.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  List<HomePost> homePosts = [];
  Post? post;
  HomeRepository homeRepository;
  int startLimit = 0;
  int sliderCurrentImgIndex = 0;
  PageController sliderController = PageController();

  void onSliderImageChange(int index) {
    sliderCurrentImgIndex = index;
    emit(HomeSuccessState());
  }

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    try {
      homePosts = await homeRepository.getHomePosts(startLimit);
      startLimit += 10;
      emit(HomeSuccessState());
    } catch (e, s) {
      log('error in getHomeData', error: e, stackTrace: s);
      emit(HomeErrorState(e.toString()));
    }
  }

  int getPostIndex(int postId) {
    for (int i = 0; i < homePosts.length; i++) {
      if (homePosts[i].postId == postId) {
        return i;
      }
    }
    return -1;
  }

  Future<void> deletePost({required int postId}) async {
    emit(HomeLoadingState());
    try {
      await homeRepository.deletePost(postId);
      final int index = getPostIndex(postId);
      if (index != -1) {
        homePosts.removeAt(index);
      }
      emit(HomeDeleteSuccessState());
    } catch (e, s) {
      log('error in deletePost', error: e, stackTrace: s);
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> isSavedPost({required int postId}) async {
    final int index = getPostIndex(postId);
    if (index == -1) {
      post!.isSaved = !post!.isSaved;
      emit(HomeSuccessState());
      if (!post!.isSaved) {
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
    } else {
      homePosts[index].isSaved = !homePosts[index].isSaved;
      emit(HomeSuccessState());
      if (!homePosts[index].isSaved) {
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
}
