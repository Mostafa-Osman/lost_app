import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:countries_utils/countries_utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class LostPersonDataScreen extends StatefulWidget {
  @override
  _LostPersonDataScreenState createState() => _LostPersonDataScreenState();
}

class _LostPersonDataScreenState extends State<LostPersonDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _genderKey = GlobalKey<FormState>();
  final _citiesKey = GlobalKey<FormState>();
  final _key = GlobalKey<FormState>();

  var personName = TextEditingController();

  var personAge = TextEditingController();

  String? selectedValue;

  final List<Country> countries = Countries.all();

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
                Stack(
                    children: [
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: black,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset('assets/images/person.png'),

                  ),
                     Container(
                          height:50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: black,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add, size: 50,color: mainColor)),

                      ),
                ]),

              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextClass(
                            text: 'الاسم',
                            fontSize: 25,
                            textAlign: TextAlign.start),
                      ),
                      TextFormFieldClass(
                        roundedRectangleBorder: 10,
                        controller: personName,
                        textHint: 'ادخل اسم المفقود',
                        textColor: lightGrey,
                        validator: (value) =>
                            value!.isEmpty ? 'من فضلك ادخل اسم المفقود' : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextClass(
                            text: 'الفئه العمريه',
                            fontSize: 25,
                            textAlign: TextAlign.start),
                      ),
                      TextFormFieldClass(
                        roundedRectangleBorder: 10,
                        controller: personName,
                        textHint: 'ادخل العمر التقريبي',
                        textColor: lightGrey,
                        validator: (value) => value!.isEmpty
                            ? 'من فضلك ادخل العمر التقريبي'
                            : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                        child: TextClass(
                            text: 'النوع',
                            fontSize: 25,
                            textAlign: TextAlign.start),
                      ),
                      //dropdownButton for Gender
                      dropdownButton(
                        key: _genderKey,
                        hintText:
                            TextClass(text: 'اختر النوع', textColor: lightGrey),
                        validator: (value) =>
                            value == null ? "من فضلك اختر النوع" : null,
                        items: ['ذكر', 'انثي', 'اخري']
                            .map((label) => DropdownMenuItem(
                                  child: TextClass(text: label.toString()),
                                  value: label,
                                ))
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                        child: TextClass(
                            text: 'مكان الفقدان',
                            fontSize: 25,
                            textAlign: TextAlign.start),
                      ),
                      //dropdownButton for City
                      dropdownButton(
                        key: _citiesKey,
                        hintText: TextClass(
                            text: 'اختر المحافظه', textColor: lightGrey),
                        validator: (value) =>
                            value == null ? "من فضلك اختر المحافظه" : null,
                        items: ['القاهره', 'الجيزه', 'اخري']
                            .map((label) => DropdownMenuItem(
                                  child: TextClass(text: label.toString()),
                                  value: label,
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 10),

                      dropdownButton(
                        key: _key,
                        hintText: TextClass(
                            text: 'اختر المنطقه', textColor: lightGrey),
                        validator: (value) =>
                            value == null ? "من فضلك اختر المنطقه" : null,
                        items: ['حلوان', 'دار السلام', 'اخري']
                            .map((label) => DropdownMenuItem(
                                  child: TextClass(text: label.toString()),
                                  value: label,
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 10),
                      TextFormFieldClass(
                        roundedRectangleBorder: 10,
                        controller: personName,
                        textHint: 'ادخل باقي تفاصيل العنوان',
                        textColor: lightGrey,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                        child: TextClass(
                          text: 'التفاصيل',
                          fontSize: 25,
                        ),
                      ),
                      TextFormFieldClass(
                        hintStyle: TextStyle(height: 10, color: lightGrey),
                        textHint: 'ادخل المزيد من التفاصيل',
                        controller: personName,
                      ),
                      SizedBox(height: 20),
                      RaisedButtonClass(
                          onPressed: () {
                            // if (_formKey.currentState!.validate())
                              // buildShowDialog(context);
                          },
                          text: "نشر",
                          textColor: white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<dynamic> buildShowDialog(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialogClass(
  //       height: 260.0,
  //       widget: Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: TextClass(
  //           text: 'سنقوم بحفظ البيانات المدخله في قاعده البيانات وانشاء منشور',fontSize: 20,
  //         ),
  //       ),
  //
  //       bottomWidget: Row(
  //           children: [
  //             Expanded(
  //                 child: TextButton(
  //               onPressed: () {},
  //               child: TextClass(
  //                 text: 'تعديل البيانات',
  //                 textColor: lightGrey,
  //               ),
  //             )),
  //             Expanded(
  //                 child: TextButton(
  //               onPressed: () {},
  //               child: TextClass(
  //                 text: 'نشر',
  //                 textColor: mainColor,
  //               ),
  //             ))
  //           ],
  //         ),
  //       ),
  //
  //   );
  // }

  dropdownButton(
      {required key, required hintText, required validator, required items}) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.only(right: 10.0, left: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: key,
        child: DropdownButtonFormField(
          hint: hintText,
          icon: Icon(Icons.keyboard_arrow_down_outlined, size: 30),
          validator: validator,
          dropdownColor: Colors.grey[200],
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          items: items,
        ),
      ),
    );
  }
}
