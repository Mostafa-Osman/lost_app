// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/home/data/Home_model/home_model.dart';
import 'package:lost_app/presentations/home/data/home_repository/home_repistory.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  late List<HomePost> homePosts = [];
  HomeRepository homeRepository;
  int startLimit = 0;
  final refreshController = RefreshController();
  final fakeRefreshController = RefreshController();

  Future<void> getHomeData() async {
    try {
      homePosts.addAll(await homeRepository.getHomePosts(startLimit));
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


  int getPostIndex(int postId){
    for(int i = 0; i < homePosts.length; i++){
      if(homePosts[i].postId == postId){
        return i;
      }
    }
    return 0;
  }

  Future<bool> deletePost({required int postId}) async {
    emit(HomeLoadingState());
    try {
      await homeRepository.deletePost(postId);
      final int index = getPostIndex(postId);
      homePosts.removeAt(index);
      return true;
    } catch (e, s) {
      log('error in deletePost', error: e, stackTrace: s);
      emit(HomeErrorState(e.toString()));
      return false;
    }
  }

  Future<void> isSavedPost({
    required int postId,
  }) async {
    final int postIndex = getPostIndex(postId);
    homePosts[postIndex].isSaved = !homePosts[postIndex].isSaved;
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
