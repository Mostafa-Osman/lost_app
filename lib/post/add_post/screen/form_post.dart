import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/data/local/cities.dart';
import 'package:lost_app/post/add_person_cubit/add_person_cubit.dart';
import 'package:lost_app/post/add_post/widgets/dropdown_button.dart';
import 'package:lost_app/post/add_post/widgets/upload_pictures.dart';

import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class AddPersonDataScreen extends StatelessWidget {
  final TextEditingController personName = TextEditingController();
  final TextEditingController personAge = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _genderKey = GlobalKey<FormState>();
  final _citiesKey = GlobalKey<FormState>();
  final _key = GlobalKey<FormState>();
  final moreTitleDetails = TextEditingController();
  final detailBox = TextEditingController();
  final String? selectedValue;
  final String textPost;

  AddPersonDataScreen({required this.textPost, this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPersonDataCubit, PersonDataStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: white,
              elevation: 0,
              centerTitle: true,
              title: const TextClass(text: 'بيانات المفقود', fontSize: 25),
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_sharp, color: black),),),
          body: SingleChildScrollView(
            child: Container(
              color: white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 35, left: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name
                          const SizedBox(height: 10),
                          const TextClass(text: 'الاسم', fontSize: 25),
                          TextFormFieldClass(
                            roundedRectangleBorder: 10,
                            controller: personName,
                            textHint: 'ادخل اسم المفقود',
                            textColor: lightGrey,
                            validator: (value) => value!.isEmpty
                                ? 'من فضلك ادخل اسم المفقود'
                                : null,
                          ),
                          //age
                          const SizedBox(height: 10),
                          const TextClass(text: 'الفئه العمريه', fontSize: 25),
                          TextFormFieldClass(
                            roundedRectangleBorder: 10,
                            controller: personAge,
                            keyboardType: TextInputType.number,
                            textHint: 'ادخل العمر التقريبي',
                            textColor: lightGrey,
                            validator: (value) => value!.isEmpty
                                ? 'من فضلك ادخل العمر التقريبي'
                                : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    //dropdownButton
                    const TextClass(text: 'النوع', fontSize: 25),
                    DropdownButtonClass(
                      keyForm: _genderKey,
                      hintText: 'اختر النوع',
                      validator: (value) =>
                          value == null ? "من فضلك اختر النوع" : null,
                      selectedValue: selectedValue,
                      items: ['ذكر', 'انثي']
                          .map(
                            (label) => DropdownMenuItem(
                              value: label,
                              child: TextClass(text: label),
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    //location
                    const SizedBox(height: 10),
                    TextClass(text: textPost, fontSize: 25),
                    //dropdownButton for City
                    DropdownButtonClass(
                      keyForm: _citiesKey,
                      hintText: 'اختر المحافظه',
                      validator: (value) =>
                          value == null ? "من فضلك اختر المحافظه" : null,
                      selectedValue: selectedValue,
                      items: ['القاهره', 'الجيزه', 'اخري']
                          .map((label) => DropdownMenuItem(
                                value: label,
                                child: TextClass(text: label),
                              ),)
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    //location details
                    DropdownButtonClass(
                      keyForm: _key,
                      hintText: 'اختر المنطقه',
                      validator: (value) =>
                          value == null ? "من فضلك اختر المنطقه" : null,
                      selectedValue: selectedValue,
                      items: ['حلوان', 'دار السلام', 'اخري']
                          .map(
                            (label) => DropdownMenuItem(
                              value: label,
                              child: TextClass(text: label),
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 10),
                    //    more title details
                    TextFormFieldClass(
                      controller: moreTitleDetails,
                      textHint: 'ادخل باقي تفاصيل العنوان',
                    ),
                    const SizedBox(height: 20),
                    const TextClass(
                      text: 'التفاصيل',
                      fontSize: 25,
                    ),

                    TextFormFieldClass(
                      textHint: 'ادخل المزيد من التفاصيل',
                      controller: detailBox,
                      maxLines: 10,
                    ),

                    // add picture
                    UploadPictures(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _genderKey.currentState!.validate() &&
                              _citiesKey.currentState!.validate() &&
                              _formKey.currentState!.validate()) {
                            log('ok');
                          }
                        },
                        text: "نشر",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
