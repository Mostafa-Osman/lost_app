import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:lost_app/data/local/pref/city_data.dart';
import 'package:lost_app/data/local/pref/governorate_data.dart';
import 'package:lost_app/post/data/models/create_post_dto.dart';
import 'package:lost_app/post/data/models/scan_data_model.dart';
import 'package:lost_app/post/data/repositories/create_post_repository.dart';
import 'package:lost_app/presentations/home/data/Home_model/home_model.dart';
import 'package:lost_app/presentations/post_details/data/post_details_model/post_model.dart';
import 'package:lost_app/shared/components/constant.dart';
import 'package:lost_app/shared/model/select_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

part 'create_post_states.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit(this.createPostRepository) : super(PersonDataInitialState());
  final CreatePostRepository createPostRepository;
  bool isLost = true;
  bool isUpdatePost = false;
  int postId = 0;
  final fakeRefreshController = RefreshController();
  TextEditingController personNameController = TextEditingController();
  TextEditingController personAgeController = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();
  final genderKey = GlobalKey<FormState>();
  TextEditingController moreAddressDetailsController = TextEditingController();
  TextEditingController moreDetailsController = TextEditingController();
  SelectableItem? selectedGender;
  SelectableItem? selectedCity;
  SelectableItem? selectedGovernorate;
  List<HomePost> scanDataResults = [];
  late HomePost createPostData;
  final imagePicker = ImagePicker();
  File? mainImage;
  String updateMainPhoto = '';
  List<String> updateExtraImages = [];
   late final HomePost updatePostData;
  List<File> extraImages = [];
  List<LostCity> filteredCities = [];

  Future<void> setPost() async {
    emit(SetPostLoading());

    try {
      final data = await createPostRepository.setPost(
        createPostDto: await getCreatePostDto(),
        isUpdatePost: isUpdatePost,
        postId: postId,
      );
      if (isUpdatePost) {
        createPostData = data as HomePost;
        emit(UpdatePostSuccess('تم تحديث المنشور بنجاح',createPostData));

      } else {
        createPostData = data as HomePost;
        emit(SetPostSuccess());
      }
      log('in cubit ${createPostData.personData!.personName}');
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(SetPostError(e.toString()));
    }
  }

  late ScanData resultOfScanData;

  Future<void> scanMainPhoto({
    required bool isLost,
    required File mainPhoto,
  }) async {
    emit(ScanPhotoLoading());
    try {
      scanDataResults.addAll(
        await createPostRepository.scanMainPhoto(
          isLost: isLost,
          mainPhoto: mainPhoto,
        ),
      );

      emit(ScanPhotoSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(ScanPhotoError(e.toString()));
    }
  }

  Future<CreatePostDto> getCreatePostDto()async {
    return  CreatePostDto.copyWith(
      name: personNameController.text,
      age: int.parse(personAgeController.text),
      gender: selectedGender!.title,
      governorate: selectedGovernorate!.title,
      city: selectedCity!.title,
      addressDetails: moreAddressDetailsController.text,
      isLost: isLost,
      moreDetails: moreDetailsController.text,
      mainPhoto: isUpdatePost ? await getImageAsFile(updateMainPhoto) : mainImage!,
      extraPhoto: extraImages,
    );
  }

  Future<File> getImageAsFile(String imageUrl) async {
    final url = AppConst.imageUrl + imageUrl;
    final http.Response responseData = await http.get(Uri.parse(url));
    final uint8list = responseData.bodyBytes;
    final buffer = uint8list.buffer;
    final byteData = ByteData.view(buffer);
    final tempDir = await getTemporaryDirectory();
    return File('${tempDir.path}/img').writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }

  Future<void> getImageFromCamera({required bool isMainImage}) async {
    emit(GetCameraImageLoading());
    try {
      final photo = await imagePicker.pickImage(source: ImageSource.camera);
      isMainImage
          ? mainImage = File(photo!.path)
          : extraImages.add(File(photo!.path));

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
          extraImages.add(File(image.path));
        }
      }
      emit(GetGalleryImageSuccess());
      log('length of list of photo ${extraImages.length.toString()}');
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
    extraImages.removeAt(index);
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
    } else if (mainImage == null && !isUpdatePost) {
      return 'يجب اختيار صوره البحث';
    } else if (updateMainPhoto == '' && isUpdatePost) {
      return 'يجب اختيار صوره البحث';
    } else {
      return 'done';
    }
  }


  Future<void> setUpdateData(Post post) async {
    isLost = post.isLost;
    isUpdatePost = true;
    updateMainPhoto = post.personData.mainPhoto;
    personNameController.text = post.personData.personName;
    personAgeController.text = post.personData.age.toString();
    postId = post.postId;
    selectedGender = SelectableItem(
      title: post.personData.gender,
      id: post.personData.gender == 'male' || post.personData.gender == 'ذكر'
          ? 0
          : 1,
    );
    selectedCity = SelectableItem(
      title: post.personData.address.district,
      id: getCitiesByGovernorateName(post.personData.address.district),
    );
    selectedGovernorate = SelectableItem(
      title: post.personData.address.city,
      id: getGovernorateByName(post.personData.address.city),
    );
    moreAddressDetailsController.text = post.personData.address.addressDetails;
    moreDetailsController.text = post.details;
    updateExtraImages.addAll(post.personData.extraPhotos);

    emit(RefreshUi());
  }

  void setIsLost({required String optionText}) {
    if (optionText == 'مكان الفقدان') {
      isLost = true;
    } else {
      isLost = false;
    }
    emit(RefreshUi());
  }

  void resetForm() {
    selectedCity = null;
    selectedGovernorate = null;
    selectedGender = null;
    filteredCities = [];
    extraImages = [];
    updateMainPhoto = '';
    updateExtraImages = [];
    mainImage = null;
    personNameController.clear();
    personAgeController.clear();
    moreAddressDetailsController.clear();
    moreDetailsController.clear();
    emit(RefreshUi());
  }

  Future<void> launchCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
