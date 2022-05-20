import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_app/data/local/pref/city_data.dart';
import 'package:lost_app/post/data/models/create_post_model.dart';
import 'package:lost_app/post/data/repositories/create_post_repository.dart';
import 'package:lost_app/shared/model/select_item.dart';

part 'create_post_states.dart';

class CreatePostCubit extends Cubit<CreatePostStates> {
  CreatePostCubit(this.createPostRepository) : super(PersonDataInitialState());
  final CreatePostRepository createPostRepository;

  //PageController pageController = PageController();

  //todo should initial it after go to screen then contain steps
  final bool isLost = true;
  TextEditingController personNameController = TextEditingController();
  TextEditingController personAgeController = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();
  final genderKey = GlobalKey<FormState>();
  TextEditingController moreAddressDetailsController = TextEditingController();
  TextEditingController moreDetailsController = TextEditingController();
  SelectableItem? selectedGender;
  SelectableItem? selectedCity;
  SelectableItem? selectedGovernorate;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> images = [];
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
      await createPostRepository.createPost(
        name: personNameController.text,
        age: int.parse(personAgeController.text),
        gender: selectedGender!.title,
        governorate: selectedGovernorate!.title,
        city: selectedCity!.title,
        addressDetails: moreAddressDetailsController.text,
        isLost: isLost,
        moreDetails: moreDetailsController.text,
        mainPhoto: '',
        extraPhoto: [''],
      );
      emit(CreatePostSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(CreatePostError(e.toString()));
    }
  }

  Future getImageFromCamera() async {
    emit(GetCameraImageLoading());
    try {
      final XFile? photo =
          await imagePicker.pickImage(source: ImageSource.camera);
      images.add(photo!);
      emit(GetCameraImageSuccess());
    } catch (error) {
      emit(GetCameraImageError());
    }
  }

  Future getImageFromGallery() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    emit(GetGalleryImageLoading());
    try {
      images.addAll(selectedImages!);
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
    } else if (images.isEmpty) {
      return 'يجب اختيار صوره واحده علي الاقل';
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
    personNameController.clear();
    personAgeController.clear();
    moreAddressDetailsController.clear();
    moreDetailsController.clear();
    emit(RefreshUi());
  }


}
