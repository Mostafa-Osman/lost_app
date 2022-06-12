import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_app/data/local/pref/city_data.dart';
import 'package:lost_app/data/models/home/home_model.dart';
import 'package:lost_app/post/data/models/scan_data_model.dart';
import 'package:lost_app/post/data/repositories/create_post_repository.dart';
import 'package:lost_app/shared/model/select_item.dart';

part 'create_post_states.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit(this.createPostRepository) : super(PersonDataInitialState());
  final CreatePostRepository createPostRepository;
  bool isLost = true;
  TextEditingController personNameController = TextEditingController();
  TextEditingController personAgeController = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();
  final genderKey = GlobalKey<FormState>();
  TextEditingController moreAddressDetailsController = TextEditingController();
  TextEditingController moreDetailsController = TextEditingController();
  SelectableItem? selectedGender;
  SelectableItem? selectedCity;
  SelectableItem? selectedGovernorate;
  List<HomePost>scanDataResults=[];
  late HomePost createPostData;
  final imagePicker = ImagePicker();
  File? mainImage;
  List<File> images = [];
  List<LostCity> filteredCities = [];


  Future<void> createPost() async {
    emit(CreatePostLoading());
    log('name=${personNameController.text}');
    log('age=${personAgeController.text}');
    log('gender=${selectedGender!.title}');
    log('governorate=${selectedGovernorate!.title}');
    log('city=${selectedCity!.title}');
    log('addressDetails=${moreAddressDetailsController.text}');
    log('moreDetails=${moreDetailsController.text}');
    try {
      createPostData= await createPostRepository.createPost(
        name: personNameController.text,
        age: int.parse(personAgeController.text),
        gender: selectedGender!.title,
        governorate: selectedGovernorate!.title,
        city: selectedCity!.title,
        addressDetails: moreAddressDetailsController.text,
        isLost: isLost,
        moreDetails: moreDetailsController.text,
        mainPhoto: mainImage!,
        extraPhoto: images,
      );
      emit(CreatePostSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(CreatePostError(e.toString()));
    }
  }

  late ScanData resultOfScanData;

  Future<void> scanMainPhoto({
    required bool isLost,
    required File mainPhoto,
  }) async {
    emit(ScanPhotoLoading());
    try {
      scanDataResults.addAll(await createPostRepository.scanMainPhoto(
        isLost: isLost,
        mainPhoto: mainPhoto,
      ),);

      emit(ScanPhotoSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(ScanPhotoError(e.toString()));
    }
  }

  Future<void> getImageFromCamera({required bool isMainImage}) async {
    emit(GetCameraImageLoading());
    try {
      final photo = await imagePicker.pickImage(source: ImageSource.camera);
      isMainImage
          ? mainImage = File(photo!.path)
          : images.add(File(photo!.path));

      emit(GetCameraImageSuccess());
    } catch (error) {
      emit(GetCameraImageError());
    }
  }

  Future<void> getImageFromGallery({required bool isMainImage}) async {
    final selectedImages = await imagePicker.pickMultiImage();
    emit(GetGalleryImageLoading());
    try {
      if (isMainImage) {
        mainImage = File(selectedImages![0].path);
      } else {
        for (final XFile image in selectedImages!) {
          images.add(File(image.path));
        }
      }
      emit(GetGalleryImageSuccess());
      log('length of list of photo ${images.length.toString()}');
    } catch (error) {
      emit(GetGalleryImageError());
    }
  }


  void setSelectedGender(SelectableItem vehicleBody) {
    selectedGender = vehicleBody;
    emit(RefreshUi());
  }

  void setSelectedCities(SelectableItem vehicleBody) {
    selectedCity = vehicleBody;
    emit(RefreshUi());
  }

  void setSelectedGovernorate(SelectableItem vehicleBody) {
    selectedGovernorate = vehicleBody;
    selectedCity = null;
    emit(RefreshUi());
  }

  void deletePhoto({required int index}) {
    images.removeAt(index);
    emit(RefreshUi());
  }

  void getFilteredCities(int id) {
    filteredCities = getCitiesByGovernorateId(id);
    emit(RefreshUi());
  }

  String getErrorMessage() {
    if (selectedGender == null) {
      return 'يجب اختيار النوع';
    } else if (selectedGovernorate == null) {
      return 'يجب اختيار المحافظه';
    } else if (selectedCity == null) {
      return 'يجب اختيار المنطقه';
    } else if (mainImage == null) {
      return 'يجب اختيار صوره البحث';
    } else {
      return 'done';
    }
  }

  void resetForm() {
    selectedCity = null;
    selectedGovernorate = null;
    selectedGender = null;
    filteredCities = [];
    images = [];
    mainImage = null;
    personNameController.clear();
    personAgeController.clear();
    moreAddressDetailsController.clear();
    moreDetailsController.clear();
    emit(RefreshUi());
  }
}
