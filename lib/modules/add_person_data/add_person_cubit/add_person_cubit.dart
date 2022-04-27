import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'add_person_states.dart';
class AddPersonDataCubit extends Cubit<PersonDataStates> {
  AddPersonDataCubit() : super(PersonDataInitialState());

  static AddPersonDataCubit get(BuildContext context) => BlocProvider.of(context);

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageCamera = [];

  Future getImageFromCamera() async {
    emit(GetCameraImageLoading());
    try {
      final XFile? photo = await imagePicker.pickImage(source: ImageSource.camera);
      imageCamera.add(photo!);
      emit(GetCameraImageSuccess());
    } catch (error) {
      emit(GetCameraImageError());
    }
  }

  Future getImageFromGallery() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    emit(GetGalleryImageLoading());
    try {
      imageCamera.addAll(selectedImages!);
      emit(GetGalleryImageSuccess());
      log(imageCamera.length.toString());
    } catch (error) {
      emit(GetGalleryImageError());
    }
  }
}
