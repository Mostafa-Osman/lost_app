import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_app/modules/add_person_data/add_person_cubit/states.dart';

class AddPersonDataCubit extends Cubit<PersonDataStates> {
  AddPersonDataCubit() : super(PersonDataInitialState());

  static AddPersonDataCubit get(context) => BlocProvider.of(context);

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageCamera = [];

  Future getImageFromCamera() async {
    emit(GetCameraImageLoading());
    try {
      XFile? photo = await imagePicker.pickImage(source: ImageSource.camera);
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
      print(imageCamera.length);
    } catch (error) {
      emit(GetGalleryImageError());
    }
  }
}
