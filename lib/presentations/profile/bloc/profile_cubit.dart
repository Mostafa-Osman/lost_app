import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/profile/bloc/profile_states.dart';
import 'package:lost_app/presentations/profile/data/profile_model/profile_model.dart';
import 'package:lost_app/presentations/profile/data/profile_repository/profile_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(ProfileInitialState());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  ProfileModel? profileModel;
  ProfileRepository profileRepository;
  int startLimit = 0;
  final refreshController = RefreshController();
  final fakeRefreshController = RefreshController();
  String image = 'assets/images/IMG20201116145812.jpg';
  String name = 'منصور طارق منصور محمد منصور';
  String number = '01149589134';
  String email = 'mansourtarek100@gmail.com';

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  Future<void> getProfileData() async {
    try {
      final profile = await profileRepository.getProfileData(startLimit);
      if(profileModel == null){
        profileModel = profile;
      }else{
        profileModel!.posts.addAll(profile.posts);
      }
      log('start limit = $startLimit');
      emit(ProfileSuccessState());
    } catch (e, s) {
      log('error in getProfileData', error: e, stackTrace: s);
      emit(ProfileErrorState(e.toString()));
    }
  }

  Future<void> onLoading() async {
    startLimit = profileModel!.posts.length;
    await getProfileData();
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    emit(ProfileLoadingState());
    startLimit = 0;
    await getProfileData();
    refreshController.refreshCompleted();
  }

  Future<void> removePost(int postId) async {
    for(int i = 0; i < profileModel!.posts.length ; i++){
      if(profileModel!.posts[i].postId == postId){
        profileModel!.posts.removeAt(i);
        emit(ProfileDeletePostSuccessState());
        break;
      }
    }
    emit(ProfileSuccessState());
  }


// void setEditPageController(){
//   nameController.text = name;
//   numberController.text = number;
//   emailController.text = email;
//   emit(SetEditPageControllerState());
// }
// void setEditPageDetails(){
//   name = nameController.text;
//   number = numberController.text;
//   email = emailController.text;
//   emit(SetEditPageDetailsState());
// }
}
