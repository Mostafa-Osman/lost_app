import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'on_boarding_states.dart';
class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  String buttonText = 'التالي';
  bool isLastPage = false;



  List<OnBoardingModel> splash = [
    OnBoardingModel(
        image: 'assets/images/welcome_1.svg',
        title: 'هل تبحث عن احد المفقودين ',
        body:
            "اذا كنت تبحث عن احد الأشخاص المفقودين يمكنك ارفاق صوره لهذا الشخص و سوف نساعدك في ايجاده",),
    OnBoardingModel(
        image: 'assets/images/welcome_2.svg',
        title: 'هل وجدت احد المفقودين ',
        body:
            "اذا كنت قد وجدت شخصا مفقوداو لا تستطيع الوصول الى ذويه فيمكنك ارفاق صورة له وسوف نساعدك في الوصول الى اقربائه",),
    OnBoardingModel(
        image: 'assets/images/welcome_3.svg',
        title: 'كل ما عليك هو ارفاق صورة وسنقوم بالبحث بدلا عنك ',
        body:
            "نقوم بتحليل الصورة عن طريق احدى تقنيات الذكاء الاصطناعي ومن ثم البحث في قاعدة البيانات التي تحتوي على العديد من الصور لاشخاص مفقودين  ",),
  ];

  void changeTextButton({required bool changeText}) {
    changeText ? buttonText = 'هيا نبدأ' : buttonText = 'التالي';
    emit(ChangeButtonTextSuccess());

  }

}

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body,});
}
