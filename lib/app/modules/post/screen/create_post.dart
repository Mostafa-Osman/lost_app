import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/modules/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/app/modules/post/widgets/add_main_photo.dart';
import 'package:lost_app/app/modules/post/widgets/cities_sheet.dart';
import 'package:lost_app/app/modules/post/widgets/create_post_button.dart';
import 'package:lost_app/app/modules/post/widgets/form_create_post.dart';
import 'package:lost_app/app/modules/post/widgets/gender_sheet.dart';
import 'package:lost_app/app/modules/post/widgets/governorate.dart';
import 'package:lost_app/app/modules/post/widgets/upload_pictures.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class CreatePostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);
    final argument = ModalRoute.of(context)!.settings.arguments! as List;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        centerTitle: true,
        title: const TextClass(text: 'بيانات المفقود', fontSize: 20.0),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Stack(
            children: [
              SizedBox(
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    const TextClass(
                      textAlign: TextAlign.start,
                      text: 'اضافه صوره البحث',
                      fontSize: 15,
                    ),
                    const SizedBox(height: 10),
                    const AddMainPhoto(),
                    const FormCreatePost(),
                    const SizedBox(height: 10),
                    const GenderSheet(),
                    GovernoratesSheet(
                      titleOfCity: argument[0].toString(),
                    ),
                    const CitiesSheet(),
                    const SizedBox(height: 5.0),
                    TextFormFieldClass(
                      controller:
                          addPersonDataCubit.moreAddressDetailsController,
                      textHint: 'المزيد من تفاصيل العنوان',
                      roundedRectangleBorder: 8.0,
                      hintStyle: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 20),
                    const TextClass(
                      text: 'التفاصيل',
                      fontSize: 15,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 5.0),
                    TextFormFieldClass(
                      textHint: 'ادخل المزيد من التفاصيل',
                      controller: addPersonDataCubit.moreDetailsController,
                      roundedRectangleBorder: 8.0,
                      hintStyle: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 20.0),
                    const TextClass(
                      textAlign: TextAlign.start,
                      text: 'اضافه المزيد من الصور',
                      fontSize: 15,
                    ),
                    const SizedBox(height: 10.0),
                    UploadPictures(),
                    const SizedBox(height: 100.0),
                  ],
                ),
              ),
              CreatePostButton(
                isUpdatePost: argument[1] == 'update-Post',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
