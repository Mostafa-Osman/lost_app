import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_app/presentations/home/data/Home_model/home_model.dart';
import 'package:lost_app/presentations/profile/bloc/profile_states.dart';
import 'package:lost_app/presentations/profile/data/profile_model/profile_model.dart';
import 'package:lost_app/presentations/profile/data/profile_repository/profile_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(ProfileInitialState());

  ProfileModel? profileModel;
  List<HomePost>? savedPosts;
  ProfileRepository profileRepository;
  int startLimit = 0;
  int savedStartLimit = 0;
  final refreshController = RefreshController();
  final fakeRefreshController = RefreshController();
  final imagePicker = ImagePicker();
  File? mainImage;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> getImageFromCamera() async {
    emit(ProfileLoadingState());
    try {
      final photo = await imagePicker.pickImage(source: ImageSource.camera);
      mainImage = File(photo!.path);
      emit(ProfileSuccessState());
    } catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }

  Future<void> getImageFromGallery() async {
    final selectedImages = await imagePicker.pickMultiImage();
    emit(ProfileLoadingState());
    try {
      mainImage = File(selectedImages![0].path);
      emit(ProfileSuccessState());
    } catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }

  Future<void> getProfileData() async {
    try {
      final profile = await profileRepository.getProfileData(startLimit);
      if (profileModel == null) {
        profileModel = profile;
      } else {
        profileModel!.posts.addAll(profile.posts);
      }
      setEditPageController();
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
    for (int i = 0; i < profileModel!.posts.length; i++) {
      if (profileModel!.posts[i].postId == postId) {
        profileModel!.posts.removeAt(i);
        emit(ProfileDeletePostSuccessState());
        break;
      }
    }
    emit(ProfileSuccessState());
  }

  Future<void> updateProfile() async {
    emit(ProfileLoadingState());
    try {
      await profileRepository.updateProfile(
        userName: nameController.text,
        phoneNumber: numberController.text,
        email: emailController.text,
        photo: mainImage!,
      );
      getProfileData();
      emit(ProfileUpdateSuccessState());
    } catch (e, s) {
      log('error in updateProfile', error: e, stackTrace: s);
      emit(ProfileErrorState(e.toString()));
    }
  }

  void setEditPageController() {
    nameController.text = profileModel!.username!;
    numberController.text = profileModel!.phoneNumber!;
    emailController.text = profileModel!.email;
    emit(ProfileSuccessState());
  }

  Future<void> getSavedPosts() async {
    emit(ProfileLoadingState());
    try {
      savedPosts = await profileRepository.getSavedPosts(savedStartLimit);
      savedStartLimit = savedPosts!.length;
      emit(ProfileSuccessState());
    } catch (e, s) {
      log('error in getSavedPosts', error: e, stackTrace: s);
      emit(ProfileErrorState(e.toString()));
    }
  }
  Future<void> unSavePost(int postId) async {
    for (int i = 0; i < savedPosts!.length; i++) {
      if (savedPosts![i].postId == postId) {
        savedPosts![i].isSaved = !savedPosts![i].isSaved;
        await Future.delayed(const Duration(seconds: 3));
        savedPosts!.removeAt(i);
        emit(ProfileDeletePostSuccessState());
        break;
      }
    }
  }

}
