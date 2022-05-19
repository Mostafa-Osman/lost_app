import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post/widgets/bottom_nav_bar.dart';
import 'package:lost_app/post/create_post/widgets/cities_sheet.dart';
import 'package:lost_app/post/create_post/widgets/gender_sheet.dart';
import 'package:lost_app/post/create_post/widgets/governorate.dart';
import 'package:lost_app/post/create_post/widgets/upload_pictures.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class CreatePostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);
    // final argument = ModalRoute.of(context)!.settings.arguments! as List;
    // //todo mostafa after mansour finish check user want update post or create new one
    // if (argument[1] == 'isUpdatePost') {
    //   addPersonDataCubit.resetForm();
    // } else {
    //   //todo mansour you should make set field function in cubit and call it here
    // }
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
      body: BlocBuilder<CreatePostCubit, CreatePostStates>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Form(
                        key: addPersonDataCubit.nameFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            const TextClass(
                              text: 'الاسم',
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                            const SizedBox(height: 5),
                            TextFormFieldClass(
                              roundedRectangleBorder: 8.0,
                              controller:
                                  addPersonDataCubit.personNameController,
                              textHint: 'ادخل اسم المفقود',
                              textColor: lightGrey,
                              textInputAction: TextInputAction.next,
                              hintStyle: const TextStyle(fontSize: 12),
                              validator: (value) => value!.isEmpty
                                  ? 'من فضلك ادخل اسم المفقود'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            const TextClass(
                              text: 'الفئه العمريه',
                              fontSize: 15,
                            ),
                            const SizedBox(height: 5),
                            TextFormFieldClass(
                              roundedRectangleBorder: 8.0,
                              controller:
                                  addPersonDataCubit.personAgeController,
                              keyboardType: TextInputType.number,
                              textHint: 'ادخل العمر التقريبي',
                              hintStyle: const TextStyle(fontSize: 12),
                              textColor: lightGrey,
                              validator: (value) => value!.isEmpty
                                  ? 'من فضلك ادخل العمر التقريبي'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const GenderSheet(),
                      const GovernoratesSheet(
                        titleOfCity: 'soon', //argument[0].toString(),
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
                      UploadPictures(),
                      const SizedBox(height: 100.0),
                    ],
                  ),
                  //todo mostafa after mansour finish check user want to update or want to create to change text button
                  const BottomNavBar(
                    isUpdatePost: false, //[0] == 'isUpdatePost',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
