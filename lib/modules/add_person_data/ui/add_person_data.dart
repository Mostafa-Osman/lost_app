import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/add_person_data/add_person_cubit/cubit.dart';
import 'package:lost_app/modules/add_person_data/add_person_cubit/states.dart';
import 'package:lost_app/modules/add_person_data/ui/dropdown_Button.dart';
import 'package:lost_app/modules/add_person_data/ui/upload_pictures.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class Keys {
  static final _formKey = GlobalKey<FormState>();
  static final _genderKey = GlobalKey<FormState>();
  static final _citiesKey = GlobalKey<FormState>();
  static final _key = GlobalKey<FormState>();
}

class AddPersonDataScreen extends StatelessWidget {

  final TextEditingController personName = TextEditingController();
  final TextEditingController personAge = TextEditingController();
  final moreTitleDetails = TextEditingController();
  final detailBox = TextEditingController();
  String? selectedValue;
  final String textPost;

  AddPersonDataScreen({required this.textPost});

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
              title: TextClass(text: 'بيانات المفقود', fontSize: 25),
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_sharp, color: black))),
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
                      key: Keys._formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name
                          SizedBox(height: 10),
                          TextClass(text: 'الاسم', fontSize: 25),
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
                          SizedBox(height: 10),
                          TextClass(text: 'الفئه العمريه', fontSize: 25),
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
                    SizedBox(height: 10),

                    //dropdownButton
                    TextClass(text: 'النوع', fontSize: 25),
                    DropdownButtonClass(
                      keyForm:  Keys._genderKey,
                      hintText: 'اختر النوع',
                      validator: (value) =>
                          value == null ? "من فضلك اختر النوع" : null,
                      selectedValue: selectedValue,
                      items: ['ذكر', 'انثي', 'اخري']
                          .map((label) => DropdownMenuItem(
                                child: TextClass(text: label.toString()),
                                value: label,
                              ))
                          .toList(),
                    ),
                    //location
                    SizedBox(height: 10),
                    TextClass(text: textPost, fontSize: 25),
                    //dropdownButton for City
                    DropdownButtonClass(
                      keyForm: Keys. _citiesKey,
                      hintText: 'اختر المحافظه',
                      validator: (value) =>
                          value == null ? "من فضلك اختر المحافظه" : null,
                      selectedValue: selectedValue,
                      items: ['القاهره', 'الجيزه', 'اخري']
                          .map((label) => DropdownMenuItem(
                                child: TextClass(text: label.toString()),
                                value: label,
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 10),
                    //location details
                    DropdownButtonClass(
                      keyForm:  Keys._key,
                      hintText: 'اختر المنطقه',
                      validator: (value) =>
                          value == null ? "من فضلك اختر المنطقه" : null,
                      selectedValue: selectedValue,
                      items: ['حلوان', 'دار السلام', 'اخري']
                          .map((label) => DropdownMenuItem(
                                child: TextClass(text: label.toString()),
                                value: label,
                              ))
                          .toList(),
                    ),

                    SizedBox(height: 10),
                    // more title details
                    TextFormFieldClass(
                      controller: moreTitleDetails,
                      textHint: 'ادخل باقي تفاصيل العنوان',
                    ),
                    SizedBox(height: 20),
                    TextClass(
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
                            if ( Keys._formKey.currentState!.validate() &&
                                Keys._genderKey.currentState!.validate() &&
                                Keys._citiesKey.currentState!.validate() &&
                                Keys._key.currentState!.validate())
                            print('ok');

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
